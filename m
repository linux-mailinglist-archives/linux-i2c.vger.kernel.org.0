Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 233DA2CDC45
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Dec 2020 18:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728874AbgLCRT4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Dec 2020 12:19:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726498AbgLCRT4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Dec 2020 12:19:56 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6F23C061A4E
        for <linux-i2c@vger.kernel.org>; Thu,  3 Dec 2020 09:19:15 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id ga15so4623702ejb.4
        for <linux-i2c@vger.kernel.org>; Thu, 03 Dec 2020 09:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
         :user-agent:mime-version:content-transfer-encoding;
        bh=ZIDCFJwPj9sTKiTkG/jQdskaVtK2lMvHf4scf+3zmw4=;
        b=haoLtEewJGkpFWfAf8bIhzGzuXdvaAYh9mP0/tLemXyx3Tne7t16Oy7DTEEsq3zEt2
         55+/eIgPljjQAsNFMVjqSxZNnolMibTq2QH0PCsb3cT0oqAxtqvHsuCzGkp8d9WoSv4D
         cWhG7T8qkahIJNF3bJvZdMRgnkYU9oceo6ftVoBtLTW3AQY8uqUsEwJeN7CFGND1S231
         kxIe5IIeNCR6l6+xahpNk2Bb1hhCFhaMsnFB0/c9OCv7LiJQcad7XvtVbUpj+HGQ3kf0
         2qpX3v8ra+nq1/gGlxX3MdtA38BYnQPTEqfRYnFgwfg4Xv7mB/CHm53JN9CWr4MWEW8q
         z8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:references:date
         :in-reply-to:message-id:user-agent:mime-version
         :content-transfer-encoding;
        bh=ZIDCFJwPj9sTKiTkG/jQdskaVtK2lMvHf4scf+3zmw4=;
        b=AA9qTwWkQAwBUi5fkiR/xrWjZoX7tJxkQjuSX0HQTvF0OcBxCXhgLyrqqf5sTeO2BV
         uUbGPUARO61zFfE75vgQ/92CL+fyawaM6dlV4KxZvK8PJ8zSu/oRKDSUjOhntYYqxDx9
         yCcwLAaM5/tSaJRhwG3+gsZ5u4FYUDVZjjHZyXgvgFQgIqkd8U3KiFYBVWPG8qKlJI7C
         a5eNoPK+TbcrEdncIgH00KQDB6Hw27i6vjvkYoCVetlxywJYyz5pFnaM5byBxZpHByFv
         8oIhP/2tNaRHY5pt+lQp7Yi2IHUSPIlRP885INjIBcgRC0h3Jtp4da1gsJERA87mSs7p
         TOmg==
X-Gm-Message-State: AOAM532fjLo/apo2X0A5sRf/qHkauDqDeaZ6FooYOGS0IDoqEiW8vtNN
        0F3tn4faB1qgD8GH4uJgguk=
X-Google-Smtp-Source: ABdhPJxAza3WI3pP+ys+F+T1YjjIrf2uPvqw60dXotv3jtoq/pZDsfCAvxZEEy7O1cEACbkDiyRk4Q==
X-Received: by 2002:a17:906:3102:: with SMTP id 2mr3477323ejx.135.1607015954683;
        Thu, 03 Dec 2020 09:19:14 -0800 (PST)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
        by smtp.gmail.com with ESMTPSA id s12sm1271384ejy.25.2020.12.03.09.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 09:19:13 -0800 (PST)
Sender: Peter Korsgaard <jacmet@gmail.com>
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
        (envelope-from <peter@korsgaard.com>)
        id 1kksG9-00056D-Ct; Thu, 03 Dec 2020 18:19:13 +0100
From:   Peter Korsgaard <peter@korsgaard.com>
To:     Stefan =?utf-8?Q?L=C3=A4sser?= <stefan.laesser@omicronenergy.com>
Cc:     <andrew@lunn.ch>, <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: ocores: Avoid false-positive error log message.
References: <6185f3fc-35ed-4de2-8bf7-fb991555580c@EXC03-ATKLA.omicron.at>
Date:   Thu, 03 Dec 2020 18:19:13 +0100
In-Reply-To: <6185f3fc-35ed-4de2-8bf7-fb991555580c@EXC03-ATKLA.omicron.at>
        ("Stefan =?utf-8?Q?L=C3=A4sser=22's?= message of "Thu, 3 Dec 2020 16:02:52
 +0100")
Message-ID: <87zh2ux0xa.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>>>>> "Stefan" =3D=3D Stefan L=C3=A4sser <stefan.laesser@omicronenergy.com>=
 writes:

 > Since commit 7723f4c5ecdb ("driver core: platform: Add an error message =
to
 > platform_get_irq*()"), platform_get_irq() will call dev_err() on an erro=
r.
 > In case of i2c ocores this leads to a false-positive error being logged:

 > [ 4.173989] 007: ocores-i2c ocores-i2c: IRQ index 0 not found

 > i2c ocores already handles the case when the IRQ cannot be found and
 > therefore there is no benefit in having this error message being logged.

 > This commit switches to platform_get_irq_optional(), which does not log
 > in case the IRQ cannot be found.

 > Signed-off-by: Stefan L=C3=A4sser <stefan.laesser@omicronenergy.com>

Reviewed-by: Peter Korsgaard <peter@korsgaard.com>

--=20
Bye, Peter Korsgaard
