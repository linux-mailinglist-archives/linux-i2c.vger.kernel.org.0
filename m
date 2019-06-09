Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 521573A677
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Jun 2019 16:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728534AbfFIOsa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 9 Jun 2019 10:48:30 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:37035 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbfFIOsa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 9 Jun 2019 10:48:30 -0400
X-Originating-IP: 81.18.188.213
Received: from localhost (unknown [81.18.188.213])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 87C621BF203;
        Sun,  9 Jun 2019 14:48:26 +0000 (UTC)
Date:   Sun, 9 Jun 2019 16:48:25 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 26/34] rtc: fm3130: simplify getting the adapter of a
 client
Message-ID: <20190609144825.GB25472@piout.net>
References: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
 <20190608105619.593-27-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190608105619.593-27-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08/06/2019 12:56:05+0200, Wolfram Sang wrote:
> We have a dedicated pointer for that, so use it. Much easier to read and
> less computation involved.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Please apply to your subsystem tree.
> 
>  drivers/rtc/rtc-fm3130.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
