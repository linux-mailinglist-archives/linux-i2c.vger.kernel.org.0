Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A42BA11D167
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2019 16:51:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729340AbfLLPvF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Dec 2019 10:51:05 -0500
Received: from out28-99.mail.aliyun.com ([115.124.28.99]:43750 "EHLO
        out28-99.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729152AbfLLPvF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Dec 2019 10:51:05 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.3872682|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.130249-0.00893165-0.86082;DS=CONTINUE|ham_system_inform|0.13022-0.00608784-0.863692;FP=0|0|0|0|0|-1|-1|-1;HT=e01a16378;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.GFo2FEj_1576165852;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GFo2FEj_1576165852)
          by smtp.aliyun-inc.com(10.147.40.7);
          Thu, 12 Dec 2019 23:50:57 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, paul@crapouillou.net, paul.burton@mips.com,
        paulburton@kernel.org, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: 
Date:   Thu, 12 Dec 2019 23:50:47 +0800
Message-Id: <1576165850-20727-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
ubject: Add I2C support for the Ingenic X1000 SoC.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for probing i2c driver on the X1000 Soc from Ingenic.
call the corresponding fifo parameter according to the device
model obtained from the devicetree.

