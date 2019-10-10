Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7746D20FD
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Oct 2019 08:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732960AbfJJGs2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Oct 2019 02:48:28 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:36268 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732956AbfJJGs2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Oct 2019 02:48:28 -0400
Received: by mail-qk1-f195.google.com with SMTP id y189so4643752qkc.3;
        Wed, 09 Oct 2019 23:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HfYimyj7XnI5kt+t6lECNj+HcYUo8K48jVJvvrvxJwU=;
        b=CHzh5/CMtBcl4mAy48yu0PywrvQ0pK9mWsdimHH8jgdHSBLl9cNKhCrpdvO4L0Zaaj
         VwAXU+VhkNVrUCrU3RuyIejzaWyqSWwSxMKr7W1whgRO8OpDt4vjoJVGtbQeBkgKQDGh
         vCtjQzVdaFc0D6pK3nDqrBDXTRMmwVcc0T0PI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HfYimyj7XnI5kt+t6lECNj+HcYUo8K48jVJvvrvxJwU=;
        b=ft3115HeR4fZXiJEHTJeqKMmswtr2SOj6tIUILTeObl8sPltrAoeXbnCZNnoHTKS1r
         5l5CPxA4u9VEZYPjVuxyh/S4OH7DeRkQeTQ2mcGaloHYXAyf8lSTGfW3V2NJ/DHZ3J0e
         gMYrdrQBso1OmqhdnqFuonLDSJFBKJrMDy6CeTChQEmBzFe3xdzPfhDq/qsmm8i8TYmb
         quTKrOvd/EMAc4CnTsOKfx2DIl3SjSB3itXV/4o/iADuCfpFj3RCfzarO94sMROdd1yy
         /uDKeISRxr0PZWGa+l8RUMuYTO7z+iXedg6yCzwkgzdWHQhF90jKqxs5D0EagPwGap50
         QHFQ==
X-Gm-Message-State: APjAAAU6GXbTWTbptuSeOwKErkK5wU/0QGDw2T8I7V4+xmMqZDDDd/Hi
        Qgccla8Mbi4P5sEt0mVtDxUFqQlvkzZjR7A6+UI=
X-Google-Smtp-Source: APXvYqwoWtsEFPJ7Ma76eSNtW4TPaTGucXelYXNVmcWl2X/aPwSWHNNk6gYfy+Y0OlvgYSg2H1snmH4FDyZYbyorRFg=
X-Received: by 2002:a37:4dca:: with SMTP id a193mr8086400qkb.292.1570690107291;
 Wed, 09 Oct 2019 23:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <20191009212034.20325-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20191009212034.20325-1-jae.hyun.yoo@linux.intel.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Thu, 10 Oct 2019 06:48:15 +0000
Message-ID: <CACPK8XfKCSNsQJa2J2jKZJ7LGZh3zXAOfBYnp5X0w=TH4JfSpQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: fix master pending state handling
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
        Cedric Le Goater <clg@kaod.org>, linux-i2c@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 9 Oct 2019 at 21:20, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> In case of master pending state, it should not trigger a master
> command, otherwise data could be corrupted because this H/W shares
> the same data buffer for slave and master operations. It also means
> that H/W command queue handling is unreliable because of the buffer
> sharing issue. To fix this issue, it clears command queue if a
> master command is queued in pending state to use S/W solution
> instead of H/W command queue handling. Also, it refines restarting
> mechanism of the pending master command.
>
> Fixes: 2e57b7cebb98 ("i2c: aspeed: Add multi-master use case support")
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Acked-by: Joel Stanley <joel@jms.id.au>

While reviewing I was concerned about the locking in
aspeed_i2c_master_xfer. It's a bit hairy, and I am not convinced it is
without bugs.
