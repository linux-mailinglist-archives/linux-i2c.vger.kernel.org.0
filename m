Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 383FA30DDD0
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Feb 2021 16:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233739AbhBCPPO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Feb 2021 10:15:14 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:55068 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233607AbhBCPM7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Feb 2021 10:12:59 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 113FAJLY083315;
        Wed, 3 Feb 2021 15:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=mime-version :
 message-id : date : from : to : cc : subject : content-type :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=tn1oS4f9oG4XZKyO86rkAb7Hp1ZAn9pyTm/+KhEGSls=;
 b=mdiXyN3uO/vLxT292IEig6lf1U5np2LxuBi/yTRywnsGYfsYTLP0zyDvm9T5hAMrwkCJ
 HFylMTvX2+dEianlcmc5IaiLsP3PK38GcyWj7g4vpT6+52uFjD8Lqr590PoKVCxMptsT
 a/URUwV13CbRIjMmHad+aJ6qLQsvbT9dgDcwd5Oqx1C9iGeR1DkP7RFJlABpKXZeQNG+
 LOhgg12V2TxF4Uqgv7u7eBCxjQm0dlpXlm9fNZM2HRiaYnotWjusKSk36BLAMhAI6xAN
 x3lhmW/+f5XBOFIRb715Mek7cF4I7AphrybigCetEHGxX5Z95CgEDomGTnI7yWmJpKJ3 Uw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 36cxvr3ag6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 03 Feb 2021 15:12:07 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 113FAIOV040702;
        Wed, 3 Feb 2021 15:12:05 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 36dh7tm1xs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 03 Feb 2021 15:12:05 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 113FC4D4003836;
        Wed, 3 Feb 2021 15:12:05 GMT
Received: from mwanda (/10.175.219.159) by default (Oracle Beehive Gateway
 v4.0) with ESMTP ; Wed, 03 Feb 2021 06:41:30 -0800
MIME-Version: 1.0
Message-ID: <YBq2Fa+crJUXGIU4@mwanda>
Date:   Wed, 3 Feb 2021 06:41:25 -0800 (PST)
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     samuel@sholland.org
Cc:     linux-i2c@vger.kernel.org
Subject: [bug report] i2c: mv64xxx: Add runtime PM support
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9883 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102030096
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9883 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1011
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102030096
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Samuel Holland,

The patch e5c02cf54154: "i2c: mv64xxx: Add runtime PM support" from
Jan 3, 2021, leads to the following static checker warning:

	drivers/i2c/busses/i2c-mv64xxx.c:816 mv64xxx_of_config()
	warn: 'drv_data->clk' isn't an ERR_PTR

drivers/i2c/busses/i2c-mv64xxx.c
   803  static int
   804  mv64xxx_of_config(struct mv64xxx_i2c_data *drv_data,
   805                    struct device *dev)
   806  {
   807          const struct of_device_id *device;
   808          struct device_node *np = dev->of_node;
   809          u32 bus_freq, tclk;
   810          int rc = 0;
   811  
   812          /* CLK is mandatory when using DT to describe the i2c bus. We
   813           * need to know tclk in order to calculate bus clock
   814           * factors.
   815           */
   816          if (IS_ERR(drv_data->clk)) {

This check used to be correct, but now if it's an error pointer in probe
then we set it to NULL.

   817                  rc = -ENODEV;
   818                  goto out;
   819          }
   820          tclk = clk_get_rate(drv_data->clk);

The result is that "tclk" is zero.  So probably the correct fix is to
change the IS_ERR() check to a NULL check?  zero rate seems useless.

   821  
   822          if (of_property_read_u32(np, "clock-frequency", &bus_freq))
   823                  bus_freq = I2C_MAX_STANDARD_MODE_FREQ; /* 100kHz by default */
   824  
   825          if (of_device_is_compatible(np, "allwinner,sun4i-a10-i2c") ||
   826              of_device_is_compatible(np, "allwinner,sun6i-a31-i2c"))
   827                  drv_data->clk_n_base_0 = true;
   828  
   829          if (!mv64xxx_find_baud_factors(drv_data, bus_freq, tclk)) {
   830                  rc = -EINVAL;
   831                  goto out;
   832          }
   833  

regards,
dan carpenter
