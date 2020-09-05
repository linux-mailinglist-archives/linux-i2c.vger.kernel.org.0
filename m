Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B1B025E78D
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Sep 2020 14:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728314AbgIEMeE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 08:34:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgIEMeD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 08:34:03 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84605C061244;
        Sat,  5 Sep 2020 05:34:02 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id y17so5234765lfa.8;
        Sat, 05 Sep 2020 05:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=t854kOldY0BU542TztnP6NrgeTuoBg1ycvUcY82anFQ=;
        b=K5iTRjKUQPoVE7cAHM46/lEp0UhliJ8Wle8/xWaKuZiwJXrJ4U1Wkyz8WPyzk7wsRk
         hZtpMmsyztjDcXD43cSp2xi+zeeHvns+uJKjWOYJLNKbrwOKOVR3R86vZGlNM2TnPuIY
         ebWJp+MkudIlPHFBTdNIpQaJ+YeL3TCRLWou4hAuxH6MC1xXSMINy1U+X6RHUK1bAOQ6
         zqfNldaBzU8LZL8Og4PXkAPt5ekd1cfyHIp7tp1emkN2wHhLHaO5kTmktEAh4dWsfI1E
         xrTHR8Myg6NJNv2sOvTsbPe8HPAvCkNUOx4TBXtl6+K2qQLjN91FE0f1Lk2CbmJS9RB5
         HWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=t854kOldY0BU542TztnP6NrgeTuoBg1ycvUcY82anFQ=;
        b=huh8ntWUzBA7krXVYdgV8vHP6Irbgqgjzmm+G/rh4Mvc10x57/9/yZEMnqKKSYu5Ux
         hBkwME3QeRnE9ImM+upyg3MF3jrKEFW17qJeH02ZG2C4+/4yvcIomgTUCtTdzknvp4lD
         qpdDNgvdpjSbaz00uplWOk95Lx2r1r3kN0tcW8KNXXmK2SAdy2qeZ2zuj5jIGZoOT0Pp
         cZrjwN+MGp/uK6+pygWmbZLdAKgeki2rBgu/6U06iGlKLOT8fCvYctzDoabAeCvuIHe/
         S1pq8MxhVP4O9fkDMjtm0Ahw+z1xKoL9Xk7pUfmriFvgK8nXWC//NBdXywINv20UyRXY
         bLJg==
X-Gm-Message-State: AOAM530EAvyhwXNLLd+OVsuc5guHsydixIBoyeZf+0qaGuFUHeBDMZfB
        4Sc0eOylDfBQ4hTGjXp7V1iPt/xZmUNHiR6w6BE=
X-Google-Smtp-Source: ABdhPJw9IKApXgQ3KXOHdrrIQPmofJBHmqvPfVX2J0hAb91U9ujzpIr3qrdU4rxZZ/AQskyzCqDUUfl4WM8o/sej22U=
X-Received: by 2002:ac2:42c2:: with SMTP id n2mr6120796lfl.117.1599309238586;
 Sat, 05 Sep 2020 05:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200904180647.21080-1-trix@redhat.com>
In-Reply-To: <20200904180647.21080-1-trix@redhat.com>
From:   Elie Morisse <syniurge@gmail.com>
Date:   Sat, 5 Sep 2020 14:33:47 +0200
Message-ID: <CAC_JBqor9K07a_ok35QOtd-CxYjpUu=915+HNcvYmnfunt2-Mw@mail.gmail.com>
Subject: Re: [PATCH] i2c: amd_mp2: handle num is 0 input for i2c_amd_xfer
To:     trix@redhat.com
Cc:     "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
        natechancellor@gmail.com, ndesaulniers@google.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Acked-by: Elie Morisse <syniurge@gmail.com>

Le ven. 4 sept. 2020 =C3=A0 20:06, <trix@redhat.com> a =C3=A9crit :
>
> From: Tom Rix <trix@redhat.com>
>
> clang static analyzer reports this problem
>
> i2c-amd-mp2-plat.c:174:9: warning: Branch condition evaluates
>   to a garbage value
>         return err ? err : num;
>                ^~~
>
> err is not initialized, it depends on the being set in the
> transfer loop which will not happen if num is 0.  Surveying
> other master_xfer() implementations show all handle a 0 num.
>
> Because returning 0 is expected, initialize err to 0.
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/i2c/busses/i2c-amd-mp2-plat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-amd-mp2-plat.c b/drivers/i2c/busses/i=
2c-amd-mp2-plat.c
> index 17df9e8845b6..506433bc0ff2 100644
> --- a/drivers/i2c/busses/i2c-amd-mp2-plat.c
> +++ b/drivers/i2c/busses/i2c-amd-mp2-plat.c
> @@ -155,7 +155,7 @@ static int i2c_amd_xfer(struct i2c_adapter *adap, str=
uct i2c_msg *msgs, int num)
>         struct amd_i2c_dev *i2c_dev =3D i2c_get_adapdata(adap);
>         int i;
>         struct i2c_msg *pmsg;
> -       int err;
> +       int err =3D 0;
>
>         /* the adapter might have been deleted while waiting for the bus =
lock */
>         if (unlikely(!i2c_dev->common.mp2_dev))
> --
> 2.18.1
>
