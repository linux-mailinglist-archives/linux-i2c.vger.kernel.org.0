Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F00893A67F
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Jun 2019 16:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728931AbfFIOtV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 9 Jun 2019 10:49:21 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:43669 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbfFIOtU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 9 Jun 2019 10:49:20 -0400
X-Originating-IP: 81.18.188.213
Received: from localhost (unknown [81.18.188.213])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 574AB20008;
        Sun,  9 Jun 2019 14:49:18 +0000 (UTC)
Date:   Sun, 9 Jun 2019 16:49:16 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 29/34] rtc: rx8010: simplify getting the adapter of a
 client
Message-ID: <20190609144916.GE25472@piout.net>
References: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
 <20190608105619.593-30-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190608105619.593-30-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08/06/2019 12:56:08+0200, Wolfram Sang wrote:
> We have a dedicated pointer for that, so use it. Much easier to read and
> less computation involved.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Please apply to your subsystem tree.
> 
>  drivers/rtc/rtc-rx8010.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
