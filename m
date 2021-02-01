Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 395FE30AE80
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Feb 2021 18:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231872AbhBARyV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Feb 2021 12:54:21 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:47681 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbhBARyU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Feb 2021 12:54:20 -0500
Received: from envy.fritz.box ([87.123.101.73]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N8VkX-1m2G5M1AaP-014S4G; Mon, 01 Feb 2021 18:51:41 +0100
From:   Richard Neumann <mail@richard-neumann.de>
To:     syniurge@gmail.com, nehal-bakulchandra.shah@amd.com,
        shyam-sundar.s-k@amd.com, mail@richard-neumann.de,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] i2c: i2c-amd-mp2: Clean up driver
Date:   Mon,  1 Feb 2021 18:51:36 +0100
Message-Id: <20210201175138.8986-1-mail@richard-neumann.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:J1gDmxjtCLTJUJeJgLh2zegx2U2FMGvlTC8V7JvzRo5ue9aKnRz
 hmRdh/awBuxCH0RnnJQbIqGwxqEr9j8a1lUPltoNxA5GPhtIHGNVkaTf+695/nzNHhZ7l7j
 ZT55lk7VwBI0rBH97dJsAG1vwn6EJH07gbEhWHsGAgJ5mfxsc2DDUE8Uvph+rse0IK/jWCk
 r1E7aBmAoPhilQqxx1Zhg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hdctGeT7eVc=:JvEZ5K12gGpLe+Dtv3ZSB+
 1t6uEYdfyF6q+ZW2CxPJ+EbRBO2Cc5kaQ6CmKWCr05M619e4wGtCG0fVMKejjgwNfgs56m7BM
 9fIGqM1Qe23DvBUZegA03fX+1K2d4U+7ovGS591+CMN75uxfq4SkS2VSQ8bmCNa3DXPp3cL74
 LqvMuMzkx3QbSsS9FXIVujytCUVuzX4eaLRha2L63h89ue6jkSrdRX3gDAz8AWZsA19WkcFr7
 /3dd6cyyaAsumky+M/1omlniLwoGkh7Kc9Odikj4bcUCYannJfACKRnIjPNFu2K514SF+XEdx
 v84yrngw2PvdhDsmmPcndCw12GtfD3E86hDsVFaFQZ/cI4YD8PPh8OwXhK0cxRM5IRA0pmt5a
 jrlAT9Fpu/7Qu0l6AVx9wEQwIv8GssHCFYDXApmSMug8vaPoK4rNTNuWOFS5rNZMRrsoOAdDJ
 LJqcVfPyCg==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Clean up i2c-amd-mp2-{pci,plat} drivers:
* Use pci_* logging functions provided by the kernel's PCI API.
* Remove unused macros.
* Remove useless __func__ from logging.

Changes since v1:
* Remove useless __func__ from logging.
* Assign pci_dev to local variable where applicable.

Changes since v2:
* Remove duplicate local pointer to pci_dev.

Richard Neumann (2):
  i2c: i2c-amd-mp2: Remove NIH logging functions
  i2c: i2c-amd-mp2: Remove unused macro

 drivers/i2c/busses/i2c-amd-mp2-pci.c  | 55 +++++++++++----------------
 drivers/i2c/busses/i2c-amd-mp2-plat.c |  3 +-
 drivers/i2c/busses/i2c-amd-mp2.h      |  6 ---
 3 files changed, 24 insertions(+), 40 deletions(-)

-- 
2.30.0

