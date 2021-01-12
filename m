Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DF5C2F3973
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 20:04:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727474AbhALTDV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 14:03:21 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:17662 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbhALTDV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Jan 2021 14:03:21 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5ffdf2510002>; Tue, 12 Jan 2021 11:02:41 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Jan
 2021 19:02:40 +0000
Received: from skomatineni-linux.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 12 Jan 2021 19:02:40 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <digetx@gmail.com>, <wsa@the-dreams.de>, <skomatineni@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
Subject: [PATCH v3] Create i2c_writesl_vi() to use with VI I2C
Date:   Tue, 12 Jan 2021 11:02:40 -0800
Message-ID: <1610478161-4877-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1610478161; bh=xwwBp4yfrgJzIJ1O4SXmSt1ktHP8GdLhQ92ARq5y3wA=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:X-NVConfidentiality:
         MIME-Version:Content-Type;
        b=f3SpTnVZ+LbHkhz1bWB5OTJPZBGhmiIIBYquI12O72pj0oNGU3T0xYIraVkARzVQG
         kJNbJGCdfHjPDzeVZ0NAJbRyHDQpGeoZFVprmCmG2SLWK7jUtyiXWpaZO6WIZaq2a6
         rNZ07dggOioDw/AkvzRkPKhgZJHKT2a4rYnpmaJXZEAOOxf8hrPPmEhps9XK0Rt0oi
         wnc4OgLm/T58xtKuA4ylnL3UgUxD50ksRkCiY3hlsnFZ/NLNvGlrsu2scRTqL8W7cc
         jQnOOEAUEA5oZV96F4aW4/yIFmloleJnZB6YBP4YGj9rhYROkgRp3BJ1+xMLAU6HnZ
         E7Z8IHJpqXzYA==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Patch in this series is to fix known hardware bug with VI I2C
controller where immediate multiple writes to TX_FIFO gets stuck
resulting in VI I2C controller to be in bad state.

Delta between patch versions:
[v3]:	Includes v2 feedback 
	- uses relaxed writel and readl
	- avoids type casting on data buffer during i2c_writesl_vi()
	- updated comment to clearly mention this as workaround to
	  known hardware bug with VI I2C.

[v2]:	Creates i2c_writesl_vi() for vi i2c based on v1 feedback.

[v1]:	Updates i2c_writesl() to use writel() followed by i2c_readl().

Sowjanya Komatineni (1):
  i2c: tegra: Create i2c_writesl_vi() to use with VI I2C for filling TX
    FIFO

 drivers/i2c/busses/i2c-tegra.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

-- 
2.7.4

