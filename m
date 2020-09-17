Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8DE226DC13
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 14:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgIQMw7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 08:52:59 -0400
Received: from mailout11.rmx.de ([94.199.88.76]:54087 "EHLO mailout11.rmx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727067AbgIQMwk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 17 Sep 2020 08:52:40 -0400
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mailout11.rmx.de (Postfix) with ESMTPS id 4BsbYM5NzYz41wt;
        Thu, 17 Sep 2020 14:16:39 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by kdin01.retarus.com (Postfix) with ESMTPS id 4BsbY70kfGz2xhY;
        Thu, 17 Sep 2020 14:16:27 +0200 (CEST)
Received: from N95HX1G2.wgnetz.xx (192.168.54.80) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Thu, 17 Sep
 2020 14:16:05 +0200
From:   Christian Eggers <ceggers@arri.de>
To:     Oleksij Rempel <linux@rempel-privat.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
CC:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] i2c: imx: Fix handling of arbitration loss
Date:   Thu, 17 Sep 2020 14:13:36 +0200
Message-ID: <20200917121338.10757-1-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.54.80]
X-RMX-ID: 20200917-141627-4BsbY70kfGz2xhY-0@kdin01
X-RMX-SOURCE: 217.111.95.66
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On my (noisy) system, I2C arbitration losses happen quite often. In it's
current implementation, the IAL flags is partly handled, but has a
number of shortcomings:

1. The driver runs unnecessarily in a timeout when waiting for an
interrupt.

2. The driver performs 500 ms busy-waiting without any value.

3. Arbitration loss errors may be reported one transfer later than they
occured.

Best regards
Christian


