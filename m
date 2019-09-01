Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 978A0A4881
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Sep 2019 11:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728753AbfIAJDc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 1 Sep 2019 05:03:32 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:43417 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728390AbfIAJDc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 1 Sep 2019 05:03:32 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id D716EE0004;
        Sun,  1 Sep 2019 09:03:29 +0000 (UTC)
Date:   Sun, 1 Sep 2019 11:03:29 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] rtc: s35390a: convert to
 devm_i2c_new_dummy_device()
Message-ID: <20190901090329.GY21922@piout.net>
References: <20190830133124.21633-1-wsa+renesas@sang-engineering.com>
 <20190830133124.21633-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190830133124.21633-3-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 30/08/2019 15:31:24+0200, Wolfram Sang wrote:
> I was about to simplify the call to i2c_unregister_device() when I
> realized that converting to devm_i2c_new_dummy_device() will simplify
> the driver a lot. So I took this approach.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/rtc/rtc-s35390a.c | 54 ++++++++++-----------------------------
>  1 file changed, 13 insertions(+), 41 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
