Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E92212265F
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2019 09:14:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbfLQIOh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Dec 2019 03:14:37 -0500
Received: from out28-97.mail.aliyun.com ([115.124.28.97]:49596 "EHLO
        out28-97.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbfLQIOh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Dec 2019 03:14:37 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.3438675|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.0135656-0.000354012-0.98608;DS=CONTINUE|ham_system_inform|0.00693413-0.00157795-0.991488;FP=0|0|0|0|0|-1|-1|-1;HT=e01l07426;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.GIuIYRX_1576570455;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GIuIYRX_1576570455)
          by smtp.aliyun-inc.com(10.147.40.44);
          Tue, 17 Dec 2019 16:14:27 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, mark.rutland@arm.com,
        paul@crapouillou.net, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, 2374286503@qq.com
Subject: [PATCH v3 0/2] Add I2C support for the Ingenic X1000 SoC v3
Date:   Tue, 17 Dec 2019 16:14:08 +0800
Message-Id: <1576570450-122556-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576570450-122556-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1576570450-122556-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

v2->v3:
Fix coding-style issues.

周琰杰 (Zhou Yanjie) (2):
  dt-bindings: I2C: Add X1000 bindings.
  I2C: JZ4780: Add support for the X1000.

 .../devicetree/bindings/i2c/i2c-jz4780.txt         |   4 +-
 drivers/i2c/busses/i2c-jz4780.c                    | 156 +++++++++++++++------
 2 files changed, 119 insertions(+), 41 deletions(-)

-- 
2.7.4

