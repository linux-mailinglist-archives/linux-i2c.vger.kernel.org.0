Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E87172F26E3
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 05:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728700AbhALEG6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 23:06:58 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:12090 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726647AbhALEG6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Jan 2021 23:06:58 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5ffd20390001>; Mon, 11 Jan 2021 20:06:17 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Jan
 2021 04:06:17 +0000
Received: from skomatineni-linux.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 12 Jan 2021 04:06:17 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <digetx@gmail.com>, <wsa@the-dreams.de>, <skomatineni@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
Subject: [PATCH v2] Create i2c_writesl_vi() to use with VI I2C
Date:   Mon, 11 Jan 2021 20:06:18 -0800
Message-ID: <1610424379-23653-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1610424377; bh=+WtY4xmNIdG6tMaS5K+8weiUqcdRO0eE6P6+AH5VMe4=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:X-NVConfidentiality:
         MIME-Version:Content-Type;
        b=TL+LGaFQ+rnm9g4qS3TlwF+aEY8m9fUW47OMh18gQbDW7pZYPnoP5sg5BMfJ4JXXD
         IbOqelviF4kxmjNC3lkH9KzDcXFJA4P1Yr0Q03VhB5TUdP2phHPohGFJumxh7NLHHJ
         vn7EofBgNTe1pZ+Ju+uPTmIGoi89P06m9yDSsxr/8mviJnwWtmDilzl3ADDpCqXxfI
         HOZmTK7jJjRHXZTg4qONOjVCS+B2hqymqFjOnoP7f51LzRrjdxDkLVBBEsAVZYf3MY
         3/1b7sK5M98zDS1+xRMdjKOyM20uroaji2YJKgZPixgwZD3dm2+miPxc6Q8pMxh7fb
         P2uzuuj6rZtCQ==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Patch in this series is to fix silent hang seen when using writesl()
for filling VI I2C TX FIFO.

Delta between patch versions:
[v2]:	Creates i2c_writesl_vi() for vi i2c based on v1 feedback.

[v1]:	Updates i2c_writesl() to use writel() followed by i2c_readl().


Sowjanya Komatineni (1):
  i2c: tegra: Create i2c_writesl_vi() to use with VI I2C for filling TX
    FIFO

 drivers/i2c/busses/i2c-tegra.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

-- 
2.7.4

