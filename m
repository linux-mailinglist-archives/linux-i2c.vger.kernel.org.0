Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 527551201F3
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2019 11:06:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbfLPKGf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Dec 2019 05:06:35 -0500
Received: from out28-75.mail.aliyun.com ([115.124.28.75]:46129 "EHLO
        out28-75.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727297AbfLPKGf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Dec 2019 05:06:35 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.3297215|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.0160889-0.000375421-0.983536;DS=CONTINUE|ham_system_inform|0.00381865-0.000386367-0.995795;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03279;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.GICQvrI_1576490773;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GICQvrI_1576490773)
          by smtp.aliyun-inc.com(10.147.44.129);
          Mon, 16 Dec 2019 18:06:18 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, mark.rutland@arm.com,
        paul@crapouillou.net, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, 2374286503@qq.com
Subject: [PATCH v2 0/2] Add I2C support for the Ingenic X1000 SoC
Date:   Mon, 16 Dec 2019 18:06:09 +0800
Message-Id: <1576490771-120353-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576490771-120353-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1576490771-120353-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

v1->v2:
Add code to check device_get_match_data(), if it return a NULL ptr,
then print an error message and return -ENODEV.

周琰杰 (Zhou Yanjie) (2):
  dt-bindings: I2C: Add X1000 bindings.
  I2C: JZ4780: Add support for the X1000.

 .../devicetree/bindings/i2c/i2c-jz4780.txt         |   4 +-
 drivers/i2c/busses/i2c-jz4780.c                    | 155 +++++++++++++++------
 2 files changed, 118 insertions(+), 41 deletions(-)

-- 
2.7.4

