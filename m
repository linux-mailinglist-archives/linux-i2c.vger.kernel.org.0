Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B072D89827
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2019 09:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfHLHrW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Aug 2019 03:47:22 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39227 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727127AbfHLHrW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Aug 2019 03:47:22 -0400
Received: by mail-wm1-f67.google.com with SMTP id u25so10863783wmc.4
        for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2019 00:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=aPJyuhmK2M+KC6mnAARKtr39I2//Chy5Fd8BV6X7TQ0=;
        b=wWuMidiSyxxp89AVvVLBSgf5QaqTr4R+d+NeZRQ131gQPs0l46nHdRS2gnXD60VtJI
         uHJHMXHINPxsC0Zq6z4+joiCtgtRMUEFpgubKz4mWSbtuUbeT8Um7yqBb0pWzkP9tsgu
         E0z0N+u4PRGYEjFPrdFlThtw6Enp9iuTYiha4hQTZtjPr/7Vr+8DKsvbEQB+qFn3tz9X
         lTK8w0jztXsjmYw7V0239Cegup0SOL7rVbsN/sLQj2lTZWh3tP/wJprdP2VDMTDuqEJj
         9rqf5uj4DaXZId5t8LQTOiM3haYn5b2EXHz5p1aOsoV572cOysCCbbDbuE+9HlJ++mKp
         I0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=aPJyuhmK2M+KC6mnAARKtr39I2//Chy5Fd8BV6X7TQ0=;
        b=eYI2OQoy5JCq5RRplQ3ZQRvQgWa+VpFda1Z1R1ROgR5YuKoEE0v/8zMGJTG7xmyvWG
         +CyIBrCKGpYHV+LaSsBKigqP6lBdWnHtu6j6eQjzFUsZWgvfxOya24G8/8KFWaPiyDaW
         Pxl6AlcNYGRILVcmkaGZcjODZzDe71e2HErApxfKNGpAf6PYVmaM4XqlXMZyXUvFNIiW
         NphuBPum4SuTpf5/ttCnyxX8eA605S1v5YVd8JOJ7F8ydGFvOFk/c56VCJ3av5kp0syN
         IDRO/7X5M8ISFcUlCCb1ymFaliB4UYI+gzqn+FNxDYJ4YhYy/QkjhmrqSUx7xArBpLvc
         jeuQ==
X-Gm-Message-State: APjAAAW2T39834JTAvRPPw53XQeIz6x+23VzIzakRGMfPc9nkgWDuOTL
        KDZP1HfwqkTnNd154QmyYaSdiHUJrAo=
X-Google-Smtp-Source: APXvYqwDy88mekwhAswG43mfQirOZeC4mQUuqD9A3hFYkiGJfdoRgGFQms7qSxd30pj55V3Zoa2CaQ==
X-Received: by 2002:a1c:acc8:: with SMTP id v191mr26802733wme.177.1565596040719;
        Mon, 12 Aug 2019 00:47:20 -0700 (PDT)
Received: from dell ([2.27.35.255])
        by smtp.gmail.com with ESMTPSA id 74sm4405124wma.15.2019.08.12.00.47.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 00:47:20 -0700 (PDT)
Date:   Mon, 12 Aug 2019 08:47:18 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/14] mfd: max14577: convert to i2c_new_dummy_device
Message-ID: <20190812074718.GX4594@dell>
References: <20190722172623.4166-1-wsa+renesas@sang-engineering.com>
 <20190722172623.4166-7-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190722172623.4166-7-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 22 Jul 2019, Wolfram Sang wrote:

> Move from i2c_new_dummy() to i2c_new_dummy_device(), so we now get an
> ERRPTR which we use in error handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Generated with coccinelle. Build tested by me and buildbot. Not tested on HW.
> 
>  drivers/mfd/max14577.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
