Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4427B3BB7E7
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jul 2021 09:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbhGEHg5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jul 2021 03:36:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbhGEHg4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jul 2021 03:36:56 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97E0FC061760
        for <linux-i2c@vger.kernel.org>; Mon,  5 Jul 2021 00:34:19 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id a8so9130099wrp.5
        for <linux-i2c@vger.kernel.org>; Mon, 05 Jul 2021 00:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=EBNJ83/aCZlajq80Bp2dxWGUc5q1W6Xlxd/F1gzRdXk=;
        b=Xlzk00gGZIIPjUG03hvDIbMzZnKqULFck66hAW67IX3sPMhaZg5kWn1gPXUw8ALjbZ
         U8I+2DyZjPp3FyhNSi1CUXyBRqe2vosLqYjdojnZQc7KM4T87rNdMryBqJ/sZa6Wur0g
         1bV2+twE7o/l1icuxUainWzuIUQRbzteavaQTI/NjgGuq3DOw/YJdrAPbzri1vkjAB15
         vNmLQnh/i0vwyi6kc2BjGMRnFsZd20J/NFFwepZ+NIbx19kLehzc83nr7FGmJFzhcxwj
         MrSlpDUf0WqCumoDb5lBnAIaGD6ISorisnHvcwJHyx8Ne5qr2TrNCFXNVfSfC9qbXN43
         No5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=EBNJ83/aCZlajq80Bp2dxWGUc5q1W6Xlxd/F1gzRdXk=;
        b=HU/Kaml1IZNWvNK8gMCltq3aYKfD0lEibGp7nUAYucuFeTkpmqrHL33FD7pf+U+EMI
         DRPpXX5UAb0WuI6jnS2CRIvLAVUoiAF/qh+5HjN+mvAiRFYeNUM/QUIWtEmpz3wyfGiz
         li8QuF5IDRhx/Ifz9CQ6pQYxCizAu9SqC5TWSeqs35gZTrx5L0O3Jyu+xqqpSjOdFTb6
         Yyl2Ty8I63jwnIh1tsZphoFnWd86GCbujXESH5BEB3oEO6Zi1zHRgEoKGgs/Kne2AtuC
         8b3V6AGOFPbjoRh0OM6ue7/Ri7FsXs6LMUNp6K4nhgkjWA0O1n39CQFkwaBmkLvasB4X
         yqPQ==
X-Gm-Message-State: AOAM530vfq7DddyWXa1lHBk5OYQi67TwsQS4iHfQo7Nnw4ra4W9ithkm
        jnONYQd8Nq2C69j2XQpLWmBj3A==
X-Google-Smtp-Source: ABdhPJyehcg9ReIxi1AOVhCby1G/JJZ5u9bOeyubGcqCl5ofyE6O4PKjYJShptLMWn8w2a6VlgL+iQ==
X-Received: by 2002:a5d:4a0d:: with SMTP id m13mr14086437wrq.368.1625470458082;
        Mon, 05 Jul 2021 00:34:18 -0700 (PDT)
Received: from dell ([109.180.115.218])
        by smtp.gmail.com with ESMTPSA id h8sm12128561wrt.85.2021.07.05.00.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 00:34:17 -0700 (PDT)
Date:   Mon, 5 Jul 2021 08:34:18 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     cl@rock-chips.com, thierry.reding@gmail.com, robh+dt@kernel.org,
        heiko@sntech.de, jagan@amarulasolutions.com, wens@csie.org,
        uwe@kleine-koenig.org, mail@david-bauer.net, jbx6244@gmail.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        jensenhuang@friendlyarm.com, michael@amarulasolutions.com,
        cnsztl@gmail.com, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
        linux-i2c@vger.kernel.org, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        wim@linux-watchdog.org, linux@roeck-us.net, jamie@jamieiles.com,
        linux-watchdog@vger.kernel.org, maz@kernel.org,
        linux-pwm@vger.kernel.org
Subject: Re: [RESEND PATCH v5 1/4] dt-bindings: pwm: rockchip: add
 description for rk3568
Message-ID: <YOK1+pMy+N64eR75@dell>
References: <20210622020517.13100-1-cl@rock-chips.com>
 <20210623021303.28015-1-cl@rock-chips.com>
 <20210705064914.o2neaiwqndjfdyqd@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210705064914.o2neaiwqndjfdyqd@pengutronix.de>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 05 Jul 2021, Uwe Kleine-König wrote:

> On Wed, Jun 23, 2021 at 10:13:03AM +0800, cl@rock-chips.com wrote:
> > From: Liang Chen <cl@rock-chips.com>
> > 
> > add "rockchip,rk3568-pwm", "rockchip,rk3328-pwm" for pwm nodes on
> > a rk3568 platform to pwm-rockchip.yaml.
> 
> Looks good to me
> 
> Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> Who is supposed to apply this patch? Does this need blessing by Rob?

There is no standard.  Rob will usually have some kind of arrangement
with the associated maintainer(s).  If this is a big functional
change, I would suggest letting Rob and his army of bots give it the
once over before it is applied in any case.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
