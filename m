Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE8B308C7D
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Jan 2021 19:31:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232655AbhA2S3Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Jan 2021 13:29:24 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:41215 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232662AbhA2S2v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Jan 2021 13:28:51 -0500
Received: from envy.fritz.box ([87.123.100.109]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MxmBi-1ltfG21QZ4-00zFWl; Fri, 29 Jan 2021 19:26:08 +0100
From:   mail@richard-neumann.de
To:     syniurge@gmail.com, nehal-bakulchandra.shah@amd.com,
        shyam-sundar.s-k@amd.com, mail@richard-neumann.de,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Cleanup i2c-amd-mp2 driver
Date:   Fri, 29 Jan 2021 19:26:04 +0100
Message-Id: <20210129182606.41518-1-mail@richard-neumann.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tMC1XIb9kvD8rB6rcBWRMBGngtto7ml7A+K5TMaB29J6g/2yQVr
 OfBbQbbxsjJYBzkhqQQPNiTngOl0Mt/DZHJkKWjZD0hWHwpudDum7qn9ycWRZFxVY9iuGqZ
 xYWrKRc2e9ukLzyBv4KspIM298J87Z8LufRpah+Jk0QoZtu9HdIJNKJRwHh6ss+QMFfArLH
 zUOOxWAp7dLzNNhCvyYRQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:c0JJUYhs7oQ=:x1f9wpZBWuCU6+5PPT/w4e
 fkUXa9hR1+0Nw5R8j0GoRMhY+miQUx9PMzNkzRLlXlMF4icvRz0m9E4GIlFU7zfKlGC95/KnR
 Hbzw29rhE2KIaFIisobW+m7BiFDmdIrT3LUwv91AxP5Kce6OJ5frcif+E+qSUslNholREj+6C
 fWnLUgb547Wf8Qj/Go5rLh4OvsXXyilbUC5GKSUyaM6hslDtueviXECgT3ruyg8TkfBtjrNSc
 DAv1hzDx0WZsSnALIG69agA15ceFqU5QH4KEBO0v83LQ47TgTyNy9oZ2Sw8TbdeUJqvVIKsoN
 3GGhOYCyOLTxYCmY+jjVG8QKbDqHeWdEtIDngsyXPC2DkVLMh93afnPvs6oEOxt89xZwxwN21
 FyuoSjNPgyMHV9/SxznDpgTXrwrbnIm63/zypGDW2D1QvSCTW0I89tt7AxRTX4nM1GztAKMnA
 4JnxJfQFBA==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Richard Neumann <mail@richard-neumann.de>

Cleaned up the i2c-amd-mp2-{pci,plat} drivers:
* Migrated kernel logging to pci_* log macros where applicable.
* Removed unused macros.

Richard Neumann (2):
  Removed NIH log functions
  Removed unused work_amd_i2c_common macro

 drivers/i2c/busses/i2c-amd-mp2-pci.c  | 37 ++++++++++++++-------------
 drivers/i2c/busses/i2c-amd-mp2-plat.c |  5 ++--
 drivers/i2c/busses/i2c-amd-mp2.h      |  6 -----
 3 files changed, 21 insertions(+), 27 deletions(-)

-- 
2.30.0

