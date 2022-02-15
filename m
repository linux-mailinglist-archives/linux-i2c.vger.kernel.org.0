Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46E674B7379
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Feb 2022 17:43:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236321AbiBOPQ6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Feb 2022 10:16:58 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236868AbiBOPQu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Feb 2022 10:16:50 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 271A7424AC
        for <linux-i2c@vger.kernel.org>; Tue, 15 Feb 2022 07:16:40 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id bg21-20020a05600c3c9500b0035283e7a012so1639678wmb.0
        for <linux-i2c@vger.kernel.org>; Tue, 15 Feb 2022 07:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=OIi6IjZGN1DjvNwgjy01isoyMANw0CM1niHXU8IMICs=;
        b=SwWi/sh1OtgWFbxIeTi0CIX0bG3M0dr9rvOt1C9uOIHUkmS0Tx4+euvoSu9m50hSWJ
         xzJRS0q680RYaFiTT8KsEaBI7acIfk5E6A4ednBp5mQfNhvQJOmszhd7rD8/3trkWXNe
         9hjrejLm09BjRagMsfLY7r+glUeY41hoMwa1Cr4EbMASffn+fHThPTP+nDpMs4z3h4zK
         ptWu/8xyrCdg8Sgd+v56xpvdYwhuIlHOynmCTtLZg6PnEzeA8T8q0j8IwCJPT+vIOj8d
         GceX8yjXjDmQDBXmFWZwcmyD627TV90z7DByb5HC6DvCTNIq1AX+dUhcdDt2HBYQBNTv
         APfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=OIi6IjZGN1DjvNwgjy01isoyMANw0CM1niHXU8IMICs=;
        b=xKU71HTZNARkpkJ9IQt5PgvTsOOWtgkyK1BhWDGlbJImF2+qqk4tddcdoTiuRouASD
         pFZFAicwcE1nBAwju07nhqqQgMaUQTf9pFYcOGOyQo1kv7y/KKOFJtVam7Mjvo3qdDar
         IeSPg+z2K1hkSVA/5qmSaPhG33lQ1plTrWsfRjXWr5SJ/xWmPaT3Yuy53G95AP2Ldnan
         G8HeEfzV0Hmg/vyKA8K19cBV4/4zmMvnqHe5Umr00nKglYczz4fgEb4TmVzy4YNmuUND
         VIt79SVHI0zxX+i0suSTB19o+qTs/34SGiLcxEFEII5Xhz2+Fo0VtYmSGo4RRvgF/d/h
         d2xQ==
X-Gm-Message-State: AOAM532z1F0khinEmycs62Y4tshgwt9HRnwCU61FBp/sOtLhVyxygio6
        e60LjfBIC56wkkp3eFlBVeTsJRMfILg4ng==
X-Google-Smtp-Source: ABdhPJwDYJo+GBmI826bxOJy/7iZxdyYz/3wkWRnnUCR4EQcUm4sQdJCcAWmk18wlmflepH7A2mBug==
X-Received: by 2002:a05:600c:1d92:: with SMTP id p18mr3510400wms.93.1644938198724;
        Tue, 15 Feb 2022 07:16:38 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id f25sm15472676wml.16.2022.02.15.07.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 07:16:38 -0800 (PST)
Date:   Tue, 15 Feb 2022 15:16:36 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>,
        Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH v4 0/7] Provide and use generic_handle_irq_safe() where
 appropriate.
Message-ID: <YgvD1HpN2oyalDmj@google.com>
References: <20220211181500.1856198-1-bigeasy@linutronix.de>
 <Ygu6UewoPbYC9yPa@google.com>
 <Ygu9xtrMxxq36FRH@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ygu9xtrMxxq36FRH@linutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 15 Feb 2022, Sebastian Andrzej Siewior wrote:

> On 2022-02-15 14:36:01 [+0000], Lee Jones wrote:
> > Do we really need to coordinate this series cross-subsystem?
> 
> I would suggest to merge it via irq subsystem but I leave the logistics
> to tglx.

Could you answer by other questions too please?

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
