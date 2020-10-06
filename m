Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64C07284A91
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Oct 2020 13:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgJFLAw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Oct 2020 07:00:52 -0400
Received: from mailout10.rmx.de ([94.199.88.75]:43074 "EHLO mailout10.rmx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725902AbgJFLAv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Oct 2020 07:00:51 -0400
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mailout10.rmx.de (Postfix) with ESMTPS id 4C5DzP0qQ1z35np;
        Tue,  6 Oct 2020 13:01:05 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by kdin02.retarus.com (Postfix) with ESMTPS id 4C5Dz636Pnz2TTWd;
        Tue,  6 Oct 2020 13:00:50 +0200 (CEST)
Received: from N95HX1G2.wgnetz.xx (192.168.54.97) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Tue, 6 Oct
 2020 12:52:18 +0200
From:   Christian Eggers <ceggers@arri.de>
To:     Oleksij Rempel <linux@rempel-privat.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/3] i2c: imx: Fix handling of arbitration loss
Date:   Tue, 6 Oct 2020 12:51:32 +0200
Message-ID: <20201006105135.28985-1-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201006060528.drh2yoo2dklyntez@pengutronix.de>
References: <20201006060528.drh2yoo2dklyntez@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.54.97]
X-RMX-ID: 20201006-130058-4C5Dz636Pnz2TTWd-0@kdin02
X-RMX-SOURCE: 217.111.95.66
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tuesday, 6 October 2020, 08:05:28 CEST, Uwe Kleine-König wrote:
> Could we please move clearing an irq to a dedicated function? Such that
> it looks like:
> 
> 	/* check for arbitration lost */
> 	if (temp & I2SR_IAL) {
> 		i2c_imx_clear_irq(i2c_imx, I2SR_IAL);
> 		return -EAGAIN;
> 	}
done

Changes in v2:
---------------
- Don't accidently clear additional status flags on Vybrid
  (reported by Uwe Kleine-Koenig)

Changes in v3:
---------------
- dedicated function for clearing an irq


