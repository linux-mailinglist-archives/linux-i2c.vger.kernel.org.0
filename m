Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4F524A9830
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Feb 2022 12:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232139AbiBDLGX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Feb 2022 06:06:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243660AbiBDLGW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Feb 2022 06:06:22 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5411AC061714
        for <linux-i2c@vger.kernel.org>; Fri,  4 Feb 2022 03:06:22 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id l1so186464pjn.4
        for <linux-i2c@vger.kernel.org>; Fri, 04 Feb 2022 03:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u+mYL+VzywIVH26wS1HSxqDrA1tNqxXc8JG+oEDOr+8=;
        b=yhRDisL7/XY+wHS0fCkXmr0aYHrSarzzvh9s2j7O8Za9jVx0OzhyRofVwMqUGNcwMw
         NbRZoMK0Cw6uLjIiUQDidP7EhZgKhPuOmvuKV/SsAQM53lTEGzytHR2FpzZ57pz3g/xo
         j0eCfuWSCSjdXySTchww4Di6ZW1rCJDNpcIC48mYsAxAxEJz3frfb102UVeFyV/yTUyE
         UQ5o1TiJ7F9ANqb59ldrG83GxXHlXf+OCrT3pF0lgiVEsTM7m74qHlTCmuqIqkkgN/iF
         788piO9ip9CBrV/l5iGKJZ/N8VgNE/NDJ2ZM7nL3l5+OdwFMubrybaqylZHWSWdrH+55
         gM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u+mYL+VzywIVH26wS1HSxqDrA1tNqxXc8JG+oEDOr+8=;
        b=khEAa3Y5iGGMdUzrt8yJiW/LaMi2NQAInb5FU4WFnpf+lZPGcZc680i0Kidh+92QLZ
         LXNxMgiZOBjedn3VkmhbqaLIPX73tP+KlnnQYtbTtnxv54Z9N1O9REnfLw4rnSzHrljQ
         Vl0+C6khj4OJeaVfXosQSGgzm1rk1dMGdPGuYGsdYIX//nup9wlLnK1PrjW7gaSUyn2b
         5oIp4G/tLtsa8Vts2eybEP8vbbiL8qgH0nFQhRc9w5j5nmMQPzyyIF+V8TpNiZhbhIS7
         74i+YdBzf1jotr1Es2ehPB+udMw7/aPZ5aD3n8QNrOH1wetOEcqcqWDJeFEmEGgYIDMi
         zVFQ==
X-Gm-Message-State: AOAM5307oB72JNkeZzqnDsZxzqHqK50gnatC/6QzW3lGuW9yw7zF690w
        vJpJZJ5jeRTYYfBTT5qB9jKw6BdrJWyg3bvOYkVFaOgGGdAimg==
X-Google-Smtp-Source: ABdhPJye2EDtOdfXqiaul0IQT95mWq+ySddR6CuIfiNMAjJY8THJkrzwSprn0HEScCiK/lI4uJlCQO2+CmuXjmkcx6s=
X-Received: by 2002:a17:902:d355:: with SMTP id l21mr2632623plk.117.1643972781751;
 Fri, 04 Feb 2022 03:06:21 -0800 (PST)
MIME-Version: 1.0
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org> <20220203164629.1711958-3-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220203164629.1711958-3-vladimir.zapolskiy@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Fri, 4 Feb 2022 12:06:10 +0100
Message-ID: <CAG3jFys6V3TD3g8xDb1qzkGCiMj_Rxxq3wBkZL9fBjPx5VfxZQ@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: i2c: qcom-cci: add description of a
 vbus-supply property
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 3 Feb 2022 at 17:46, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Quite regularly I2C bus lines on QCOM CCI controller require an external
> pull-up to a regulator powered line, to be able to define all such
> cases an additional vbus-supply property of a bus subnode is wanted.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> index 924ad8c03464..9f5b321748f1 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> @@ -60,6 +60,11 @@ PROPERTIES:
>         Definition: Desired I2C bus clock frequency in Hz, defaults to 100
>                     kHz if omitted.
>
> +- vbus-supply:
> +       Usage: optional
> +       Value type: phandle
> +       Definition: Regulator that provides power to SCL/SDA lines
> +
>  Example:
>
>         cci@a0c000 {
> --
> 2.33.0
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
