Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39C0C34FAC9
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 09:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234042AbhCaHwO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 03:52:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:52108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234195AbhCaHv5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Mar 2021 03:51:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D619B6199A;
        Wed, 31 Mar 2021 07:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617177117;
        bh=xpy4kRm9bmyZuWQNI+P60oqyw77tUIHQsbLiSx+3E6Y=;
        h=From:To:Cc:Subject:Date:From;
        b=m1vIExeoNfsRWSEKqDgKLxDca9fAGPXwP+WwRfX3umPtFU1ZEGNvmFWuNHPnI4nVQ
         Itto97Ddt4SjunUA8EcevSa0ABndqVugN4u4uziJ4MkXwabV460aiuNWrOi01VLrYX
         IjgVgqb4FndFuKrhuQdsJe10X8GnN6D1iV76ze2n4LqycG26syTj5sMj5pV/tG7TOU
         ptGHE//un83tEFMlLI5ffCOpgSfb0/QOY1O5m+3vkACJspTzmyDc48N5AroO1jXiDM
         /vNr68cfDzYe7j7ZrcRE2xpK/S0Z5edvA+nIGwGl+4V0nvP/amM+7Zf58B2y9j0yYc
         s9AWgCV/D15pA==
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH RFT 0/2] i2c: tegra-bpmp: cleanups
Date:   Wed, 31 Mar 2021 09:51:39 +0200
Message-Id: <20210331075141.22227-1-wsa@kernel.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

While reviewing a patch for this driver, I noticed that we can remove
quite some lines here. Not tested on HW, because I don't have it. Builds
fine, though. I'd appreciate tests / reviews. Thanks!

Wolfram Sang (2):
  i2c: tegra-bpmp: don't modify input variable in xlate_flags
  i2c: tegra-bpmp: make some functions void

 drivers/i2c/busses/i2c-tegra-bpmp.c | 52 +++++++----------------------
 1 file changed, 12 insertions(+), 40 deletions(-)

-- 
2.30.0

