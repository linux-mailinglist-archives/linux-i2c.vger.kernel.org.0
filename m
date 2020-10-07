Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29701285FBF
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Oct 2020 15:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbgJGNIK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Oct 2020 09:08:10 -0400
Received: from mga17.intel.com ([192.55.52.151]:46484 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728360AbgJGNIJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 7 Oct 2020 09:08:09 -0400
IronPort-SDR: gLhSnojKRRCFd8v2/aQgqZwO/wOw2FwDPn11CTGgb4G+VUtr8D42WwQqm+Hl/LAGB/tcrv060M
 4FcSTnX2RIWA==
X-IronPort-AV: E=McAfee;i="6000,8403,9766"; a="144848066"
X-IronPort-AV: E=Sophos;i="5.77,346,1596524400"; 
   d="scan'208";a="144848066"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2020 06:08:08 -0700
IronPort-SDR: hlosZPgWJYyzIlRRCsTCeqlwPZaQ10RDs5XScimiBjcpHkZRS/xzIY665gWJ+uyZBG2j5WAX7Z
 RGwDoEqKYN7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,346,1596524400"; 
   d="scan'208";a="354890493"
Received: from unknown (HELO [10.237.72.56]) ([10.237.72.56])
  by orsmga007.jf.intel.com with ESMTP; 07 Oct 2020 06:08:05 -0700
Subject: Re: Designeware I2C slave confusing IC_INTR_STOP_DET handle
To:     Michael.Wu@vatics.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com
Cc:     linux-i2c@vger.kernel.org, morgan.chang@vatics.com,
        dean.hsiao@vatics.com, paul.chen@vatics.com
References: <5DB475451BAA174CB158B5E897FC1525B1293AB2@MBS07.vivotek.tw>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <655eb758-c94b-d319-1866-6f1db413d337@linux.intel.com>
Date:   Wed, 7 Oct 2020 16:08:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <5DB475451BAA174CB158B5E897FC1525B1293AB2@MBS07.vivotek.tw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 10/7/20 8:10 AM, Michael.Wu@vatics.com wrote:
> These above scenarios appears when OS is busy or too late to handle I2C
> interrupts. Current i2c_dw_irq_handler_slave() seems that last
> IC_INTR_RX_FULL will be handled before IC_INTR_STOP_DET rising, or
> IC_INTR_STOP_DET will not be cleared before last IC_INTR_RX_FULL handled.
> I think it can't be guaranteed.
> 
Indeed i2c_dw_irq_handler_slave() handling looks doubtful when I look at 
it after your report. Especially many of those 
i2c_dw_read_clear_intrbits_slave() calls. I think there are good changes 
to miss some interrupts.

Unfortunately I don't have right now a setup to try myself but could you 
try these ideas to read and clear interrupt status in one place only and 
move I2C_SLAVE_WRITE_REQUESTED reporting after I2C_SLAVE_WRITE_RECEIVED 
like in a patch below?

diff --git a/drivers/i2c/busses/i2c-designware-slave.c 
b/drivers/i2c/busses/i2c-designware-slave.c
index 44974b53a626..97131e888e24 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -159,7 +159,6 @@ static int i2c_dw_irq_handler_slave(struct 
dw_i2c_dev *dev)
  	u32 raw_stat, stat, enabled, tmp;
  	u8 val = 0, slave_activity;

-	regmap_read(dev->map, DW_IC_INTR_STAT, &stat);
  	regmap_read(dev->map, DW_IC_ENABLE, &enabled);
  	regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &raw_stat);
  	regmap_read(dev->map, DW_IC_STATUS, &tmp);
@@ -168,13 +167,11 @@ static int i2c_dw_irq_handler_slave(struct 
dw_i2c_dev *dev)
  	if (!enabled || !(raw_stat & ~DW_IC_INTR_ACTIVITY) || !dev->slave)
  		return 0;

+	stat = i2c_dw_read_clear_intrbits_slave(dev);
  	dev_dbg(dev->dev,
  		"%#x STATUS SLAVE_ACTIVITY=%#x : RAW_INTR_STAT=%#x : INTR_STAT=%#x\n",
  		enabled, slave_activity, raw_stat, stat);

-	if ((stat & DW_IC_INTR_RX_FULL) && (stat & DW_IC_INTR_STOP_DET))
-		i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_REQUESTED, &val);
-
  	if (stat & DW_IC_INTR_RD_REQ) {
  		if (slave_activity) {
  			if (stat & DW_IC_INTR_RX_FULL) {
@@ -188,11 +185,9 @@ static int i2c_dw_irq_handler_slave(struct 
dw_i2c_dev *dev)
  						 val);
  				}
  				regmap_read(dev->map, DW_IC_CLR_RD_REQ, &tmp);
-				stat = i2c_dw_read_clear_intrbits_slave(dev);
  			} else {
  				regmap_read(dev->map, DW_IC_CLR_RD_REQ, &tmp);
  				regmap_read(dev->map, DW_IC_CLR_RX_UNDER, &tmp);
-				stat = i2c_dw_read_clear_intrbits_slave(dev);
  			}
  			if (!i2c_slave_event(dev->slave,
  					     I2C_SLAVE_READ_REQUESTED,
@@ -207,7 +202,6 @@ static int i2c_dw_irq_handler_slave(struct 
dw_i2c_dev *dev)
  			regmap_read(dev->map, DW_IC_CLR_RX_DONE, &tmp);

  		i2c_slave_event(dev->slave, I2C_SLAVE_STOP, &val);
-		stat = i2c_dw_read_clear_intrbits_slave(dev);
  		return 1;
  	}

@@ -219,9 +213,11 @@ static int i2c_dw_irq_handler_slave(struct 
dw_i2c_dev *dev)
  			dev_vdbg(dev->dev, "Byte %X acked!", val);
  	} else {
  		i2c_slave_event(dev->slave, I2C_SLAVE_STOP, &val);
-		stat = i2c_dw_read_clear_intrbits_slave(dev);
  	}

+	if ((stat & DW_IC_INTR_RX_FULL) && (stat & DW_IC_INTR_STOP_DET))
+		i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_REQUESTED, &val);
+
  	return 1;
  }

@@ -230,7 +226,6 @@ static irqreturn_t i2c_dw_isr_slave(int this_irq, 
void *dev_id)
  	struct dw_i2c_dev *dev = dev_id;
  	int ret;

-	i2c_dw_read_clear_intrbits_slave(dev);
  	ret = i2c_dw_irq_handler_slave(dev);
  	if (ret > 0)
  		complete(&dev->cmd_complete);
