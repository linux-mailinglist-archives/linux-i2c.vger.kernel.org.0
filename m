Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F32D48C1CB
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jan 2022 11:00:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239375AbiALKAE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jan 2022 05:00:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239359AbiALKAE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jan 2022 05:00:04 -0500
X-Greylist: delayed 416 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 12 Jan 2022 02:00:03 PST
Received: from forward500o.mail.yandex.net (forward500o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::610])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 734A6C06173F;
        Wed, 12 Jan 2022 02:00:03 -0800 (PST)
Received: from vla1-b85deedef156.qloud-c.yandex.net (vla1-b85deedef156.qloud-c.yandex.net [IPv6:2a02:6b8:c0d:89c:0:640:b85d:eede])
        by forward500o.mail.yandex.net (Yandex) with ESMTP id 018989427F9;
        Wed, 12 Jan 2022 12:53:04 +0300 (MSK)
Received: from vla3-23c3b031fed5.qloud-c.yandex.net (vla3-23c3b031fed5.qloud-c.yandex.net [2a02:6b8:c15:2582:0:640:23c3:b031])
        by vla1-b85deedef156.qloud-c.yandex.net (mxback/Yandex) with ESMTP id YKgBHTejNI-r3fa0jiw;
        Wed, 12 Jan 2022 12:53:03 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1641981183;
        bh=GBvPYx5xlO7r/in7vKblwwrgfU2MCoognfarC7rdbak=;
        h=In-Reply-To:To:From:Subject:Message-ID:Cc:References:Date;
        b=Uyp2Osp97srb3rUFOzCKjMYP5R2DOaxljSfrW8/Ojcp7zjeQ0OpRwWiaBxbz3sYod
         ku77jABkKYRqFa2ZfKkTRUtzLBkqjn6mah06d/1YhPzVPmyipL3PxyvpG86xgIVwj3
         z4cI38USXEAszEPFexrJrkmB9PehIyjMSgQMdtd8=
Authentication-Results: vla1-b85deedef156.qloud-c.yandex.net; dkim=pass header.i=@yandex.ru
Received: by vla3-23c3b031fed5.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id PaDBeQX1JP-r2QqdOrT;
        Wed, 12 Jan 2022 12:53:02 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
X-Yandex-Fwd: 2
Message-ID: <98ed8d6d16a3d472d9432eb169aa2da44b66b5cc.camel@yandex.ru>
Subject: Re: [PATCH] Revert "i2c: core: support bus regulator controlling in
 adapter"
From:   Konstantin Kharlamov <hi-angel@yandex.ru>
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Cc:     "Tareque Md.Hanif" <tarequemd.hanif@yahoo.com>,
        linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Date:   Wed, 12 Jan 2022 12:51:31 +0300
In-Reply-To: <Yd6gRR0jtqhRLwtB@ninjato>
References: <20220106122452.18719-1-wsa@kernel.org>
         <Yd6gRR0jtqhRLwtB@ninjato>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 2022-01-12 at 10:32 +0100, Wolfram Sang wrote:
> Hi everyone,
> 
> On Thu, Jan 06, 2022 at 01:24:52PM +0100, Wolfram Sang wrote:
> > This largely reverts commit 5a7b95fb993ec399c8a685552aa6a8fc995c40bd. It
> > breaks suspend with AMD GPUs, and we couldn't incrementally fix it. So,
> > let's remove the code and go back to the drawing board. We keep the
> > header extension to not break drivers already populating the regulator.
> > We expect to re-add the code handling it soon.
> > 
> > Reported-by: "Tareque Md.Hanif" <tarequemd.hanif@yahoo.com>
> > Link:
> > https://lore.kernel.org/r/1295184560.182511.1639075777725@mail.yahoo.com
> > Reported-by: Konstantin Kharlamov <hi-angel@yandex.ru>
> > Link:
> > https://lore.kernel.org/r/7143a7147978f4104171072d9f5225d2ce355ec1.camel@yandex.ru
> > BugLink: https://gitlab.freedesktop.org/drm/amd/-/issues/1850
> > Signed-off-by: Wolfram Sang <wsa@kernel.org>
> 
> So, it has been reverted now. Is someone of the original patch
> submitters interested in re-adding it? And would the reporters of the
> regression be available for further testing?

I am available for further testing.

> Thanks and happy hacking,
> 
>    Wolfram
> 

