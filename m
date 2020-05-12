Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 720C21CF44F
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 14:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729207AbgELM0g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 May 2020 08:26:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727783AbgELM0g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 May 2020 08:26:36 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A7B0C061A0E
        for <linux-i2c@vger.kernel.org>; Tue, 12 May 2020 05:26:36 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id 4so10796642qtb.4
        for <linux-i2c@vger.kernel.org>; Tue, 12 May 2020 05:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=slxR8Or9fOtkKCuML/8tuAolE3hEe64VEScXtdsZ78c=;
        b=IQl0bX9uQDZSEpBL1QdfnvVQb8awt2oSN0BrIlRlgW1pwJfRCjDwUTp19/3ZeROH05
         0tf94tK0qA4dDBba5NXmGMv30httX8Mqo53Er//jmXx0dftupi3hpGDdQPVnPgDquwn9
         /iT13QbDxnSir5uxYKehpbQgRy8F8uPXfSzTq70VIUL7a11D+GMf1y0j5mSAQJhbqYth
         QdFahA/jEdBqLiXs2CFDMERcGwVFSFvl20mSl1vDqvPtrypgXqt6Znf3zcnfBGeDibnX
         087fZH1oXn1RNoDLJ1Jp7fWOkg/jEAqQbpCWwAwdFNQGiEQBHfVx7YySNN8xHBJKrUeh
         Y3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=slxR8Or9fOtkKCuML/8tuAolE3hEe64VEScXtdsZ78c=;
        b=PCIxFG9q7UvdIqaxx/hU7k18zC4gx0pv1RzocpwmYa5kKbCtj3/4+KtI8wJpXp/byG
         hao1xK8nBw1a5Iyxk3Z0EkiYsWvMLxMQfguorG6FJI1WMKYCjbgc8Oz93QaIwEiE9Hqh
         nUxGogJhbFMZlx7k6y5DoMnMPjhLtuUcbm9MFAhUoOVJTXbMMsCOU+1M9ukeWTPyLz5a
         VuJ7xCWHUQhD2k+KjdNAPDlJyHKf1rWDWh/zxwMLHJkxwaScVV7YZHkPRMq0XZip4e+K
         Ivz767qlBV7ZwVYP1q4cuutfWUPPAdIBsJqx1dGCgcoNLKrU7V/oUXipJHIZGGMP4h58
         YGEQ==
X-Gm-Message-State: AGi0PuYa/IiTSxhZTfGQlm26y9vC6DDA85K6xAbobWjYNhBboN36Hzcv
        VdDCdqEU1+F/bpggr1A/UctPagtCojwh3gzCMwr15A==
X-Google-Smtp-Source: APiQypKFDytL4bKscWfdjy5F9YyMJ/6jtqUYtOVGna/o9F6ezUY6UD1yurIS+AgPzIq3ZX+6wEa/65/CN5uf4f6vwHs=
X-Received: by 2002:aed:257c:: with SMTP id w57mr17477020qtc.208.1589286395304;
 Tue, 12 May 2020 05:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200512122450.20205-1-geert+renesas@glider.be>
In-Reply-To: <20200512122450.20205-1-geert+renesas@glider.be>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 12 May 2020 14:26:24 +0200
Message-ID: <CAMpxmJWfEb_TiOu=cRSYLOHxi4C1icvnHyyCLfZHN=BSL9xZJg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: eeprom: at24: Fix list of page sizes for writing
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

wt., 12 maj 2020 o 14:24 Geert Uytterhoeven <geert+renesas@glider.be>
napisa=C5=82(a):
>
> "258" is an odd power-of-two ;-)
> Obviously this is a typo, and the intended value is "256".
>
> Fixes: 7f3bf4203774013b ("dt-bindings: at24: convert the binding document=
 to yaml")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documen=
tation/devicetree/bindings/eeprom/at24.yaml
> index d77bc475fd148d99..4cee72d5331877a8 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -124,7 +124,7 @@ properties:
>        may result in data loss! If not specified, a safety value of
>        '1' is used which will be very slow.
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    enum: [1, 8, 16, 32, 64, 128, 258]
> +    enum: [1, 8, 16, 32, 64, 128, 256]
>      default: 1
>
>    read-only:
> --
> 2.17.1
>

Ha! Of course it is. :)

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
