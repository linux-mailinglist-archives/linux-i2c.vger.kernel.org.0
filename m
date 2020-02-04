Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B1A81521D9
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2020 22:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727606AbgBDVTG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Feb 2020 16:19:06 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:43575 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727389AbgBDVTF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Feb 2020 16:19:05 -0500
Received: by mail-vs1-f65.google.com with SMTP id 7so12422997vsr.10
        for <linux-i2c@vger.kernel.org>; Tue, 04 Feb 2020 13:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cDQhf3pngJwbR1rzpvQJkKUBb4tiCCEEJ4Q4M59w1tI=;
        b=M0ctaJidym4w3v7F3eWRuV5lKNaGvr7QcuL8CyBluGLOCIRUMJ+MyNiUbAv2YFH6dR
         z+UgAPYCogS/3dgL2A0nO8wJo5dwiG7JsrrJLEeymRo8PxvngwNow3za7KlB7LdOFatn
         q9/Zt7Y8c0MKbEf9RjOKPOEsWMHoz/k431xxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cDQhf3pngJwbR1rzpvQJkKUBb4tiCCEEJ4Q4M59w1tI=;
        b=LZpwIlH8bf0InSIVcYM8XNWVL30Ff49bg4D01biwAjV0hZSYk3P2QDRVuJJ44Y27W6
         zY1a9I8364HCudSaUHO1GHxR5v7i40iKMFXsJsng8iNti79CWAugQ0i1Qt0JWfDQ/Adj
         v07I0t+hevpjU9HJF02CAOh+01ownkAmKIWpkXF1RMEEz1dEaRufUd3vpsak12JPCofC
         y5778lw3wA/rfilnCd/gDOyaQdX0OIsLeEsGhXXDt2ka8ZDNFo4UNT8/m/i5NMhlggFm
         xf8gy21+4OmUOOpWILHE0wxZg5EF6Zxai00MAK7u3yfIVbgiBsQgiGrzpvqoNW9OstkM
         q2+w==
X-Gm-Message-State: APjAAAUkKnezq7UVKLgsR3HtHoS6SjNUd/gixsmo+yrUe75Bece4Poda
        y2FiJ+jF3DyvilEM9b56U5Pkv/fG6Xo=
X-Google-Smtp-Source: APXvYqx9Je4kmWXHdS1gIPn8OywBVxF6gzCbd6Od0a6SDR39W5Vd2k6Etc4uqqDicj3hILhYbbTJ8A==
X-Received: by 2002:a67:6341:: with SMTP id x62mr18888268vsb.88.1580851144689;
        Tue, 04 Feb 2020 13:19:04 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id f9sm2155417vkl.21.2020.02.04.13.19.04
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 13:19:04 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id p14so12467315vsq.6
        for <linux-i2c@vger.kernel.org>; Tue, 04 Feb 2020 13:19:04 -0800 (PST)
X-Received: by 2002:a67:8704:: with SMTP id j4mr21048875vsd.106.1580851143693;
 Tue, 04 Feb 2020 13:19:03 -0800 (PST)
MIME-Version: 1.0
References: <20200204193152.124980-1-swboyd@chromium.org> <20200204193152.124980-4-swboyd@chromium.org>
In-Reply-To: <20200204193152.124980-4-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 4 Feb 2020 13:18:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XynUY1++OqZMMWVQq0FJCxPUBp0umeDOxs4W8WH6bNQw@mail.gmail.com>
Message-ID: <CAD=FV=XynUY1++OqZMMWVQq0FJCxPUBp0umeDOxs4W8WH6bNQw@mail.gmail.com>
Subject: Re: [PATCH 3/3] i2c: qcom-geni: Drop of_platform.h include
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Dilip Kota <dkota@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Tue, Feb 4, 2020 at 11:31 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> This driver doesn't call any DT platform functions like of_platform_*().
> Remove the include as it isn't used.
>
> Cc: Girish Mahadevan <girishm@codeaurora.org>
> Cc: Dilip Kota <dkota@codeaurora.org>
> Cc: Alok Chauhan <alokc@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
