Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F13781DA004
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 20:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbgESSwm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 14:52:42 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:42750 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726447AbgESSwm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 May 2020 14:52:42 -0400
Received: by mail-il1-f194.google.com with SMTP id 18so447435iln.9;
        Tue, 19 May 2020 11:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HMRNysK7idMmu7BvR5VTbVghXE/SUfxxeNA9Jql37t8=;
        b=A8hrrFtR98DX9hlRHlMPN4t68szlsRbRe3oTe/D2b+0KzVj59aHwt7ACF6sFCf1BWl
         e/dEBhGRO3eDcZyAbfIqWorPa3YjsTta0ID2sjvyB4s2JIrARxpE9BzSlLOd3mnaB/CB
         Nkb3fzTcbCb7xVTjMheMb1acYU3m9XBO2bLoUCBN9lDRTo588rxL7QFZJw+59mYTSc1N
         wogB0ASzKNas+elon48Ca/Qgona+1M9TEdC3399L0ICrf1/kUhsNMI2DhK6Rxiyz0y/a
         0V/vCMdV6O+C2tgUi9cWEj+w6YIvTFD0R7eoTz5kskLApzFL62w+WCHu2JPuDfAACRv+
         1b4w==
X-Gm-Message-State: AOAM530JLsxcv9LpwiQTDO/hZbaroxl9k5VJ7lAREx7Uj3SIY6g3uyzQ
        m5rOVu9LRGwGHH6BjCQXqQ==
X-Google-Smtp-Source: ABdhPJwICzymNwkDVvqws9DTa/sDPOXwVe8u63wyzZ9iLNMZ9uqIWCcioChH2qHFMYl8ToMRA8Zb9Q==
X-Received: by 2002:a92:2801:: with SMTP id l1mr473703ilf.132.1589914361419;
        Tue, 19 May 2020 11:52:41 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id r9sm130432ilm.10.2020.05.19.11.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 11:52:40 -0700 (PDT)
Received: (nullmailer pid 466038 invoked by uid 1000);
        Tue, 19 May 2020 18:52:40 -0000
Date:   Tue, 19 May 2020 12:52:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: eeprom: at24: Fix list of page sizes for
 writing
Message-ID: <20200519185240.GA465837@bogus>
References: <20200512122450.20205-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512122450.20205-1-geert+renesas@glider.be>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 12 May 2020 14:24:47 +0200, Geert Uytterhoeven wrote:
> "258" is an odd power-of-two ;-)
> Obviously this is a typo, and the intended value is "256".
> 
> Fixes: 7f3bf4203774013b ("dt-bindings: at24: convert the binding document to yaml")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
