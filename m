Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C940E288788
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Oct 2020 13:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387908AbgJILE0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Oct 2020 07:04:26 -0400
Received: from mailout08.rmx.de ([94.199.90.85]:33509 "EHLO mailout08.rmx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731963AbgJILE0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 9 Oct 2020 07:04:26 -0400
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mailout08.rmx.de (Postfix) with ESMTPS id 4C74vq4tYbzMrW1;
        Fri,  9 Oct 2020 13:04:23 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by kdin02.retarus.com (Postfix) with ESMTPS id 4C74vW0Ljbz2TRlZ;
        Fri,  9 Oct 2020 13:04:07 +0200 (CEST)
Received: from N95HX1G2.wgnetz.xx (192.168.54.145) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Fri, 9 Oct
 2020 13:03:28 +0200
From:   Christian Eggers <ceggers@arri.de>
To:     Oleksij Rempel <linux@rempel-privat.de>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "David Laight" <David.Laight@ACULAB.COM>
CC:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Christian Eggers <ceggers@arri.de>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v6 0/3] i2c: imx: Fix handling of arbitration loss
Date:   Fri, 9 Oct 2020 13:03:17 +0200
Message-ID: <20201009110320.20832-1-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.54.145]
X-RMX-ID: 20201009-130413-4C74vW0Ljbz2TRlZ-0@kdin02
X-RMX-SOURCE: 217.111.95.66
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Changes in v5:
---------------
- Added missing "Tested-By" tags.

Changes in v4:
---------------
- Extend comment (W1C vs. W0C)

Changes in v3:
---------------
- dedicated function for clearing an irq

Changes in v2:
---------------
- Don't accidently clear additional status flags on Vybrid
(reported by Uwe Kleine-Koenig)


