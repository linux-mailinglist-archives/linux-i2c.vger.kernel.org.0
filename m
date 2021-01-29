Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7E4C308D6A
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Jan 2021 20:36:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232926AbhA2T2o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Jan 2021 14:28:44 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:50879 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232630AbhA2T2i (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Jan 2021 14:28:38 -0500
Received: from envy.fritz.box ([87.123.100.109]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis) id
 1MpDVx-1llE9z1jw7-00qi4J; Fri, 29 Jan 2021 20:25:56 +0100
From:   mail@richard-neumann.de
To:     syniurge@gmail.com, nehal-bakulchandra.shah@amd.com,
        shyam-sundar.s-k@amd.com, mail@richard-neumann.de,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] i2c: i2c-amd-mp2: Clean up driver
Date:   Fri, 29 Jan 2021 20:25:51 +0100
Message-Id: <20210129192553.55906-1-mail@richard-neumann.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QV1wb189yYBNMQ2EyN0xXBM5UzM+IdWTE5KlBkIRhnAi1vEYNqx
 M0D/EKEaVL+Fv3S5V58VUiOum5iuOf54RZcr3Wqb6gbDCFS09nTiajdGNxWhuXnd6qrHR32
 Rcdw95+4qt5EF/y+NM06wXuonDzDXKV6z2GOvLMgRdhOFrdTNziunKQFo0vDjFIsYkr0A1P
 svShz6AxxNRumA8VQ3Lhg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kCGMQwuokuU=:qmjTKxOIHrrLWbXmoT2hrV
 ZEyjEz01OlbsZVp++RqduUFUEW8qqEslbOzRW33pyLEYpx01+rkrvwPi8LyIa5twoP7Z5LMr/
 GXU5Yoakr/geK5X9DkPej7fIZO5xVytLUEeaDs2GiPa261MfBxIc37TXjDu/J6qwSDCD9GD8C
 xu43MD2JOoVTVq6RqiwO5UnLIsS/9iCOcQNQ1S/+lXi+ZV7pysMHafjz5tecJJbXdtKDRFzYb
 xWKyUj95TBiLMrhGG7C/WgC80+zfdlzovGYGSCL+ElxHYidbaV/dDgPLyHSnOsdfIo3gmS1KQ
 Ky93Vho/DKnjTzbBehWWWLi0asSWV92ZhKYPFQwN2zbWZAyG6jX94CiVSYl7iZ+3Iy77C0wS0
 uMlgg/uZXe7eyij7QVX/bc/tqKfGavOZHSe5zd7tQ2yUYKhSP26Y87J/4tSB/grruqJ9d7Qns
 97HQxiEsyg==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Richard Neumann <mail@richard-neumann.de>

Clean up i2c-amd-mp2-{pci,plat} drivers:
* Use pci_* logging functions provided by the kernel's PCI API.
* Remove unused macros.
* Remove useless __func__ from logging.

Changes since v1:
* Remove useless __func__ from logging.
* Assign pci_dev to local variable where applicable.

Richard Neumann (2):
  i2c: i2c-amd-mp2: Remove NIH logging functions
  i2c: i2c-amd-mp2: Remove unused macro

 drivers/i2c/busses/i2c-amd-mp2-pci.c  | 53 +++++++++++++--------------
 drivers/i2c/busses/i2c-amd-mp2-plat.c |  3 +-
 drivers/i2c/busses/i2c-amd-mp2.h      |  6 ---
 3 files changed, 27 insertions(+), 35 deletions(-)

-- 
2.30.0

