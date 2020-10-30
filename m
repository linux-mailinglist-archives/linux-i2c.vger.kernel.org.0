Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE3D29FF5F
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Oct 2020 09:05:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgJ3IFO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Oct 2020 04:05:14 -0400
Received: from mail.vivotek.com ([60.248.39.150]:48994 "EHLO mail.vivotek.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726082AbgJ3IFK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 30 Oct 2020 04:05:10 -0400
Received: from pps.filterd (vivotekpps.vivotek.com [127.0.0.1])
        by vivotekpps.vivotek.com (8.16.0.42/8.16.0.42) with SMTP id 09U80MIm015010;
        Fri, 30 Oct 2020 16:04:56 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivotek.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=dkim;
 bh=ECF5VlgUT7MZAjqCXV2X/LFjRoTX9Mtp2Qy4jq7s1LQ=;
 b=NhVda22k2X3jNVi6kCfPI9OJ1drN1d++14RrbjCBvtM4NASCJVBH/wrVNoIYlMJ1i7PA
 wIk2hYjXwBJgIB+90nQCz8C2DQ3aYJjFPQYYxwx5XE2suFwQAGRzzotxmkh36TubgrOm
 0TBOOR3cPbfO6GRzb4qcev3pk8Q5b2RZtB8= 
Received: from cas01.vivotek.tw ([192.168.0.58])
        by vivotekpps.vivotek.com with ESMTP id 34c6q166qp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Fri, 30 Oct 2020 16:04:56 +0800
Received: from localhost.localdomain (192.168.17.134) by CAS01.vivotek.tw
 (192.168.0.58) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 30 Oct
 2020 16:04:55 +0800
From:   Michael Wu <michael.wu@vatics.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Morgan Chang <morgan.chang@vatics.com>,
        Michael Wu <michael.wu@vatics.com>
Subject: [PATCH 0/2] Designware I2C slave confusing IC_INTR_STOP_DET handle
Date:   Fri, 30 Oct 2020 16:04:18 +0800
Message-ID: <20201030080420.28016-1-michael.wu@vatics.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.17.134]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-10-29_12:2020-10-29,2020-10-29 signatures=0
X-Proofpoint-Spam-Reason: safe
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When an I2C slave works, sometimes both IC_INTR_RX_FULL and
IC_INTR_STOP_DET may be rising during an IRQ handle, especially when
system is busy or too late to handle interrupts.

If IC_INTR_RX_FULL is rising and the system doesn't handle immediately,
IC_INTR_STOP_DET may be rising and the system has to handle these two
events. For this there may be two problems:

1. IC_INTR_STOP_DET is rising after i2c_dw_read_clear_intrbits_slave()
   done: It seems invalidated because I2C_SLAVE_WRITE_REQUESTED is
   reported after the 1st I2C_SLAVE_WRITE_RECEIVED.

$ i2cset -f -y 2 0x42 0x00 0x41; dmesg -c
[0][clear_intrbits]0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
[1][irq_handler   ]0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
I2C_SLAVE_WRITE_RECEIVED
[0][clear_intrbits]0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
[1][irq_handler   ]0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x714 : INTR_STAT=0x204
I2C_SLAVE_WRITE_REQUESTED
I2C_SLAVE_WRITE_RECEIVED
[0][clear_intrbits]0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x710 : INTR_STAT=0x200
[1][irq_handler   ]0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x510 : INTR_STAT=0x0
I2C_SLAVE_STOP
[2][clear_intrbits]0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x510 : INTR_STAT=0x0

  t1: ISR with the 1st IC_INTR_RX_FULL.
  t2: Clear listed IC_INTR bits by i2c_dw_read_clear_intrbits_slave().
  t3: Enter i2c_dw_irq_handler_slave() and then report
      I2C_SLAVE_WRITE_RECEIVED due to 'if (stat & DW_IC_INTR_RX_FULL)'
      matched.
  t4: ISR with the 2nd IC_INTR_RX_FULL.
  t5: Clear listed IC_INTR bits by i2c_dw_read_clear_intrbits_slave() while
      IC_INTR_STOP_DET has not risen yet.
  t6: IC_INTR_STOP_DET is rising after entering i2c_dw_irq_handler_slave().
      The driver reports I2C_SLAVE_WRITE_REQUESTED first due to
      'if ((stat & DW_IC_INTR_RX_FULL) && (stat & DW_IC_INTR_STOP_DET))'
      matched and then reports I2C_SLAVE_WRITE_RECEIVED.
  t7: Reports I2C_SLAVE_STOP due to IC_INTR_STOP_DET not be cleared yet.

2. Both IC_INTR_STOP_DET and IC_INTR_RX_FULL are rising before
   i2c_dw_read_clear_intrbits_slave(): I2C_SLAVE_STOP never be reported
   because IC_INTR_STOP_DET was cleared by
   i2c_dw_read_clear_intrbits_slave().

$ i2cset -f -y 2 0x42 0x00 0x41; dmesg -c
[0][clear_intrbits]0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
[1][irq_handler   ]0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
I2C_SLAVE_WRITE_RECEIVED
[0][clear_intrbits]0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x714 : INTR_STAT=0x204
[1][irq_handler   ]0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
I2C_SLAVE_WRITE_RECEIVED

  t1: ISR with the 1st IC_INTR_RX_FULL.
  t2: Clear listed IC_INTR bits by i2c_dw_read_clear_intrbits_slave().
  t3: Enter i2c_dw_irq_handler_slave() and then report
      I2C_SLAVE_WRITE_RECEIVED due to 'if (stat & DW_IC_INTR_RX_FULL)'
      matched.
  t4: ISR with both IC_INTR_STOP_DET and the 2nd IC_INTR_RX_FULL.
  t5: Clear listed IC_INTR bits by i2c_dw_read_clear_intrbits_slave().
      The current IC_INTR_STOP_DET was cleared by this
      i2c_dw_read_clear_intrbits_slave().
  t6: Enter i2c_dw_irq_handler_slave() and then report
      i2c_slave_event(WRITE_RECEIVED) due to
      'if (stat & DW_IC_INTR_RX_FULL)' matched.
  t7: I2C_SLAVE_STOP never be reported because IC_INTR_STOP_DET was
      cleared in t5.

In order to resolve these problems, i2c_dw_read_clear_intrbits_slave()
should be called only once in an ISR and take the returned stat to handle
those occurred events. The ISR handling has to be adjusted to conform event
reporting described in Documentation/i2c/slave-interface.rst.

Michael Wu (2):
  i2c: designware: call i2c_dw_read_clear_intrbits_slave() once
  i2c: designware: slave should do WRITE_REQUESTED before WRITE_RECEIVED

 drivers/i2c/busses/i2c-designware-slave.c | 52 +++++++++--------------
 1 file changed, 19 insertions(+), 33 deletions(-)

-- 
2.17.1

