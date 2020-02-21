Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7BC1679C9
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2020 10:50:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728167AbgBUJuO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Feb 2020 04:50:14 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44011 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727150AbgBUJuO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Feb 2020 04:50:14 -0500
Received: by mail-ot1-f65.google.com with SMTP id p8so1447921oth.10;
        Fri, 21 Feb 2020 01:50:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LGtPhAVjIvRquefayqs6YiIA/tNdWVoN+WLDPh1u7gE=;
        b=MvypmPBbjmipDMALQTb/Kz6EUsxFrmfj9XTg25swESgqg2fdIRrb7z9lEdnA4MN4FK
         4w6kiqpXck/bhiBkMnn3usG90+InPrvLb7g6vsIxGGCSRNPO81V6R6LqY+ANhUCFatrE
         PzNx9vTDqd9nfspRnsNZw1I+C/i6PMwglk5+fVFesyGlMVkADhu+LMOp62d+/zcmUUIh
         SOXF2K6jhLY8H/0rfoPW8SxPqK3rNlnolNNMMFjFFIUXh81V0O5Z6WbG2a/OsQDLW1Dn
         VRef4stnGCNJ1RJpyy+7Kye7tb9dp1eFr7q4CovRDTyixB5TojNC38TUEtET7SJqTvK+
         WS6w==
X-Gm-Message-State: APjAAAV4DuWk1iihnZF6YW2elnBQq99Ser9QcGQ77kvNdw9yueuqyVNW
        UHAU1aABDr+iSMWNbyDmTpqw6i9xJQ6ZIzqLdWs=
X-Google-Smtp-Source: APXvYqwm+9QUakxr4sAH21zwcX7ad8NwXiWnkq/zDR06hcy6RD3aCDm8gQ7zDkbZbqGMQTUgWgb5ROsz2Bqdvv3L3xg=
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr12558550otk.145.1582278613276;
 Fri, 21 Feb 2020 01:50:13 -0800 (PST)
MIME-Version: 1.0
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com> <20200220172403.26062-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200220172403.26062-5-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Feb 2020 10:50:02 +0100
Message-ID: <CAMuHMdW-foZ+o1RbvEH8xX_zPa0sJ_kqRX+u4=bFRFNCHbLdwg@mail.gmail.com>
Subject: Re: [RFC PATCH 4/7] i2c: of: remove superfluous parameter from
 exported function
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-i3c@lists.infradead.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Feb 20, 2020 at 6:26 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> 'dev' is only used for printing an error message. However, that
> information is not needed because '%pOF' fully describes the location of
> the error. Drop the 'dev' and remove the superfluous parameter.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
