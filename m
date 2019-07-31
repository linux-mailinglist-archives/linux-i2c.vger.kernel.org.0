Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 559CE7C54A
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jul 2019 16:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387665AbfGaOqu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Jul 2019 10:46:50 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46745 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387649AbfGaOqt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 Jul 2019 10:46:49 -0400
Received: by mail-pf1-f193.google.com with SMTP id c3so8858374pfa.13
        for <linux-i2c@vger.kernel.org>; Wed, 31 Jul 2019 07:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:from:to:subject:user-agent:date;
        bh=mXrN86Eu2CP26yhQ/6WETjSqBeLcHl2RwLyOJM6x5jk=;
        b=XZ9J92fIR4AGZPgrNeCSx5yVQFFaePHjv0dcyX2Ie8QcuIk1im6khj9UekqtERbXN1
         dBbp18fAdYOLxKGPTfpHPyokbm/Kt8onB6Lx1dUoRelGoSGEfEoUAFmUkMSW3+K2/HiK
         uB9EkuH8EWXiixZrhDn9eCkR1Zp4RlUfZH4CQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:from:to:subject
         :user-agent:date;
        bh=mXrN86Eu2CP26yhQ/6WETjSqBeLcHl2RwLyOJM6x5jk=;
        b=oP2v7fT9aiJ1mX2cJ2iXJkW8A7nM8werzmro71fdZJTXO14rgsmZ6WmfnWpvm3pcGz
         BOlwps3KN02ezOqOeUrsvdZ5ZQ43fHxvWfD+f99JbW/w8nnykcVxqiU2p6CWE74PUnqB
         XnBkFU+/ZgVjTZRHUWzIEpBpn7VD4g/qQBGteJ+fdNyXTTMyUe543r5eHz0vNLvOYJjN
         DdIQ17oFlsIEid7qUFa7c1fSSUIr3iZ6MnROUwFCzEzf5ZAqwu/4Nu1MWUEk/jalV9so
         +lyKImiig4QB0gUWdzADu0wUi8HovqljNezTy/iMjKcTZGrKWM5droV2+vVscKidvyKG
         IHQg==
X-Gm-Message-State: APjAAAV0F4lwEYKK1Q7ExYzef6dEVXTwp5cJxmMyXP1D31UIwsxpJH6k
        Xs0zdlFSN/zIJotazf4becg1c5hqZhY39w==
X-Google-Smtp-Source: APXvYqx/xFzpnnt67hw/9+TPmFCGkdhH0oYZrh5fzzpS7nJ+tW76x1zUG4gfYAOkEgaR//mtWW+obQ==
X-Received: by 2002:a17:90a:258b:: with SMTP id k11mr3249368pje.110.1564584409094;
        Wed, 31 Jul 2019 07:46:49 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id h11sm69817121pfn.120.2019.07.31.07.46.48
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 07:46:48 -0700 (PDT)
Message-ID: <5d41a9d8.1c69fb81.bdbb9.bea3@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190731143011.GB1680@kunai>
References: <20190730181557.90391-1-swboyd@chromium.org> <20190730181557.90391-19-swboyd@chromium.org> <20190731143011.GB1680@kunai>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v6 18/57] i2c: Remove dev_err() usage after platform_get_irq()
User-Agent: alot/0.8.1
Date:   Wed, 31 Jul 2019 07:46:47 -0700
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Quoting Wolfram Sang (2019-07-31 07:30:11)
> > -dev_err(...);
>=20
> What about pr_err, ...?

Sure. I haven't tried to find these ones or pr_warn(), etc.

>=20
> > While we're here, remove braces on if statements that only have one
> > statement (manually).
>=20
> You can let cocci do this for you, too. From the top of my head:
>=20
> if (...)
> - {
>  S
> - }
>=20
> with S being a statement and this rule depending on the matching rule.
>=20

Cool thanks for the tip! I'll have to try it out.

