Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23E5B1201E8
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2019 11:06:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727215AbfLPKGV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Dec 2019 05:06:21 -0500
Received: from out28-146.mail.aliyun.com ([115.124.28.146]:51813 "EHLO
        out28-146.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbfLPKGV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Dec 2019 05:06:21 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.4296881|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.0302769-0.000786501-0.968937;DS=CONTINUE|ham_system_inform|0.0159629-0.00273335-0.981304;FP=0|0|0|0|0|-1|-1|-1;HT=e01l07394;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.GICQvrI_1576490773;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GICQvrI_1576490773)
          by smtp.aliyun-inc.com(10.147.44.129);
          Mon, 16 Dec 2019 18:06:17 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, mark.rutland@arm.com,
        paul@crapouillou.net, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, 2374286503@qq.com
Subject: Add I2C support for the Ingenic X1000 SoC v2.
Date:   Mon, 16 Dec 2019 18:06:08 +0800
Message-Id: <1576490771-120353-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
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

