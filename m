Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 365F722D9A5
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Jul 2020 21:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbgGYTvG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Jul 2020 15:51:06 -0400
Received: from www.zeus03.de ([194.117.254.33]:34750 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726681AbgGYTvG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 25 Jul 2020 15:51:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=naxFnvuFwK4Qx7Jgob06kfiGfld
        V3nViNdWujbEJOE0=; b=s8w/uu9DCCQ9zS/n2Vh4CWQzMLwAR9yj2H+uND+umaV
        te/ihcc+DYGRQV1aZk46XLvpWfwWh0Hl/zMoMZPsPYZUE7czn8OJ+MjNOknQqGYn
        bZDOr4z3NE+NFzUEkSUg/NbMDG8NAsg46b5BCKQ11VcBZY6tKyRZxQcjX1qjqn8g
        =
Received: (qmail 4064601 invoked from network); 25 Jul 2020 21:51:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jul 2020 21:51:03 +0200
X-UD-Smtp-Session: l3s3148p1@jHXbaEmrzJQgAwDPXyGYAKSbnEfVwReQ
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Alain Volmat <alain.volmat@st.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] i2c: slave: improve sanity checks when un-/registering
Date:   Sat, 25 Jul 2020 21:50:51 +0200
Message-Id: <20200725195053.14334-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Unregistering was completly missing the check, registering was missing
ERR_PTR conditions. Fix both.

Wolfram Sang (2):
  i2c: slave: improve sanity check when registering
  i2c: slave: add sanity check when unregistering driver

 drivers/i2c/i2c-core-slave.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.20.1

