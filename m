Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9593DBAA2
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Jul 2021 16:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239108AbhG3OcR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Fri, 30 Jul 2021 10:32:17 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:38691 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239042AbhG3OcR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Jul 2021 10:32:17 -0400
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id EACA7C4997
        for <linux-i2c@vger.kernel.org>; Fri, 30 Jul 2021 14:29:19 +0000 (UTC)
Received: (Authenticated sender: gregory.clement@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 755BEC0004;
        Fri, 30 Jul 2021 14:28:58 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Hermann Lauer <Hermann.Lauer@iwr.uni-heidelberg.de>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: I2C MV64XXX: Showing Allwinner debug LCR register in bus lock case
In-Reply-To: <20210729073100.GA8757@lemon.iwr.uni-heidelberg.de>
References: <20210729073100.GA8757@lemon.iwr.uni-heidelberg.de>
Date:   Fri, 30 Jul 2021 16:28:58 +0200
Message-ID: <87mtq3zxhx.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Hermann,

> Dear Maintainers,
>
> if Allwinner i2c locks, the is a LCR register (reg_base + 0x20),
> which shows directly the state of the SCL and SDA lines. So you can
> see which line (if any) is pulled externally low.
>
> Is there a similar usefull register in the original MV64XXX MARVELL
> chip?

I've check on the Armada 38x datasheet and at least on this one there is
no such register or register with similar information. That's mean you
won't be able to use it for any device only the Allwinner ones.

Grégory

>
> I'd like to make the patch https://bitbucket.org/hlauer/kernel/src/master/patches/i2c-buslock.patchl working for that chip, too.
>
> Thanks for any ideas.
>
> Greetings
>   Hermann
>
> -- 
> Administration/Zentrale Dienste, Interdiziplinaeres 
> Zentrum fuer wissenschaftliches Rechnen der Universitaet Heidelberg
> IWR; INF 205; 69120 Heidelberg; Tel: (06221)54-14405 Fax: -14427
> Email: Hermann.Lauer@iwr.uni-heidelberg.de

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
