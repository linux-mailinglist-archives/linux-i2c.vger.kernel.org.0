Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC9CE353E08
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Apr 2021 12:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237698AbhDEJDe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Apr 2021 05:03:34 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:15540 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237684AbhDEJDd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Apr 2021 05:03:33 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FDPky5dqDzPnpm
        for <linux-i2c@vger.kernel.org>; Mon,  5 Apr 2021 17:00:42 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Mon, 5 Apr 2021 17:03:23 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <linux-i2c@vger.kernel.org>
Subject: [PATCH drivers/i2c 0/3] Fix ERRORs reported by checkpatch
Date:   Mon, 5 Apr 2021 17:03:47 +0800
Message-ID: <1617613430-11921-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix ERRORs reported by checkpatch, no functional changes.

Tian Tao (3):
  i2c: amd8111: Fix coding style issues
  i2c: iop3xx: Fix coding style issues
  i2c: nomadik: Fix space errors

 drivers/i2c/busses/i2c-amd8111.c | 268 +++++++++++++++++++--------------------
 drivers/i2c/busses/i2c-iop3xx.c  |  28 ++--
 drivers/i2c/busses/i2c-nomadik.c |   4 +-
 3 files changed, 151 insertions(+), 149 deletions(-)

-- 
2.7.4

