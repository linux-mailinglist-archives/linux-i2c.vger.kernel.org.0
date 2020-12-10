Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2C6F2D516D
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Dec 2020 04:36:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729974AbgLJDeL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Dec 2020 22:34:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729955AbgLJDeD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Dec 2020 22:34:03 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C02BDC0613D6
        for <linux-i2c@vger.kernel.org>; Wed,  9 Dec 2020 19:33:23 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id v3so2061287plz.13
        for <linux-i2c@vger.kernel.org>; Wed, 09 Dec 2020 19:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oszoW78Jw5SoM2iR34Fr4+RLLm8ZTjPLxEZzZaG3ms0=;
        b=JuEcKqrX9Yse9U/lpgfDBKJqbYzKY8Pp2L/ZV3A/VDag1jenlaOKLaMzGP3lOaXnEm
         RIKbiFw/MhYRrkUf0FrG/DxKuz/VjNA3muC//mdw/8BJA7ALbfgY26Szu5mS10d9fCiA
         BUiN73B736EQUwdG8w3aaNaqEgTg4z0DHDMhNMZMF5VxhwpwrvJsQxW/DBZSoEoYIfwE
         4yWC7Crss06Q/XXDqZVOPYlz057m8m/gCnVNhx8d9zzuDzRe+u3bGU5hUpg9I4P/EUtf
         wTX57xtvOgLHZ1JtN03DrjSrVJz1C4fuf5shQ/uE9soBZ8I7OyHUKYo8BLdQmsimY4R4
         ODzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oszoW78Jw5SoM2iR34Fr4+RLLm8ZTjPLxEZzZaG3ms0=;
        b=RPh9Gi2Hg/vMmpvu6O/TNp/al8p8k7TbjUH/kSzRonAp5PvQOn5sW6B/zUKjaBFngB
         x14UivgTVwlbWmXU6qM7wVY3GvVuDiX+fpCQJVySV4QAAFMzm0azziD5sXu2l4WWgb81
         TCH9Wee5CWz/Hb0Wse4LWD1+QugOGFEvPy7CZAHD7BCaBzWkOnSOdVSSflsadFX3d6bc
         HSi7f0Y6ZQhf8LDjYzNXG0exRTSdf/QCzY6qgTPf45C8SkrP/zCyA6Q5Xjsgvtdt7fH1
         RW8XrDpiPhGkfclVXhVu+c7GBQk3PZAAqQdN2oPDyUeLGtKNcvpt1dgBsJQOuABA7vXn
         137w==
X-Gm-Message-State: AOAM530sR3FXLf/aJ2Nma9BFQpqBL+apgiqJ6YCKHXVOb1ZbsjlJ4kXu
        2kCrZoUI+XB8KxJoaPl/Rt2Z
X-Google-Smtp-Source: ABdhPJys+KO/P20Go26WDez9Jpgwx9nfyFdmbPbJLh9JatVHO1PO0YacTxWLeBYARq51wxOnYclLEg==
X-Received: by 2002:a17:902:b70f:b029:da:b944:f3b7 with SMTP id d15-20020a170902b70fb02900dab944f3b7mr4645162pls.82.1607571203329;
        Wed, 09 Dec 2020 19:33:23 -0800 (PST)
Received: from thinkpad ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id p9sm3685475pjb.3.2020.12.09.19.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 19:33:22 -0800 (PST)
Date:   Thu, 10 Dec 2020 09:03:15 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 13/18] arm: dts: owl-s500: Add I2C support
Message-ID: <20201210033315.GB6466@thinkpad>
References: <cover.1605823502.git.cristian.ciocaltea@gmail.com>
 <99e81f582b19d0e13abf506c1d7dda0f0a857fd5.1605823502.git.cristian.ciocaltea@gmail.com>
 <20201128073516.GZ3077@thinkpad>
 <20201209202506.GD3499@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201209202506.GD3499@kunai>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 09, 2020 at 09:25:06PM +0100, Wolfram Sang wrote:
> On Sat, Nov 28, 2020 at 01:05:16PM +0530, Manivannan Sadhasivam wrote:
> > On Fri, Nov 20, 2020 at 01:56:07AM +0200, Cristian Ciocaltea wrote:
> > > Add I2C controller nodes for Actions Semi S500 SoC.
> > > 
> > > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
> > 
> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> DTS changes usually go in via arm-soc, so I am not picking this unless
> there is a reason to do so.
> 

No you should not. This patch will go through actions sub tree which me or
Andreas will pick it.

Thanks,
Mani

