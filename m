Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC1123A04F
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Aug 2020 09:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbgHCHau (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Aug 2020 03:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbgHCHau (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Aug 2020 03:30:50 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 686ECC06174A;
        Mon,  3 Aug 2020 00:30:50 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id e4so7223416pjd.0;
        Mon, 03 Aug 2020 00:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=PBrvFHoSs/Tws1YijGRQSOfvPzyuxM0wjmh1FRA7GaM=;
        b=YXmW6x7YAEV/NWDv/of9Ha9DeVzz0Y5NMe2GOeIqMwfNVFHepl97MT0LJxhQYlRqsI
         cfu5dcud9bAGK6far7frDKPIuYByLc8fmX+ItLoMF26hpOCPbGLC7oGsZYzAZiD1K88g
         sN+Y/croJTz1ZNlUe2qhK5XPvbmXUm7Nobr8AsCSHyJCuP9MmUflBdGcm7gQTFjWCKQZ
         bcwzJiEYZyHOaraIrB9brsFurwic8QMbbzzSzOpvAlO0eAooLVU4LGIEy1+DGk4lhOkF
         Sr8WgwuvaznbMNrAAE44pS2GfXkuTJpO/AnRhwy88r7WoL3AYN5Jk3zhpooB6FJVz4zF
         DnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=PBrvFHoSs/Tws1YijGRQSOfvPzyuxM0wjmh1FRA7GaM=;
        b=lM3DWPQ6ct6BAPwIIlgOc3j6YlXeybQn6aBrXqXt2tUIfGCqy08QpBG6hS++XCUUMF
         pRZZB0C9F5ulpXCdOuPkG2NTfx3PIKevwsbIaA5dFiENekAi1k7MIyq8Djsito2ajcMx
         55vQLKIAs2Jiklg6RbF8AKmVJvLORz2pmeAoDnGQOxv7XOnbke7NuKMiUz+jb/WO5szp
         rxKslOsu1SyXwyeqHCGNGYPdWUaikXVX0KMW3URDIGFImI2ADF9r2iFQffWXEkZGID2O
         PLEVJSZ6IraXQyd90muBWoLmcE4gn79tNlE3/xoe2xbhhM4KFqR6hpLolsnssVqqzn1/
         1XVQ==
X-Gm-Message-State: AOAM532rVfkQbAN1ruCM/sL7nTbL8yXMFBEyJqQcgfDmLJbLb0vbBAYJ
        6cDd3E4u4yvf30L6YMGvfhQ63n4Y+Ms=
X-Google-Smtp-Source: ABdhPJzjHyqk78VEQLlCqjdWdetBMKnZ0y3/HLzFhcNbJVdnfX5c4k7045NxjjC33iwXZmVNeoMJlw==
X-Received: by 2002:a17:90b:148b:: with SMTP id js11mr16962176pjb.234.1596439849983;
        Mon, 03 Aug 2020 00:30:49 -0700 (PDT)
Received: from [192.168.173.154] (76-10-188-40.dsl.teksavvy.com. [76.10.188.40])
        by smtp.gmail.com with ESMTPSA id i12sm2628729pgj.23.2020.08.03.00.30.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Aug 2020 00:30:49 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH i2c-tools] i2ctransfer: add support for I2C_M_RECV_LEN
From:   Daniel Stodden <daniel.stodden@gmail.com>
In-Reply-To: <20200802213828.GB13339@kunai>
Date:   Mon, 3 Aug 2020 00:30:46 -0700
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C82A0A94-A06B-4D42-B71B-F14D48D5E029@gmail.com>
References: <20200802192842.13527-1-wsa+renesas@sang-engineering.com>
 <C5EC2F45-41AD-465E-83F9-BDE3640B02AA@gmail.com>
 <20200802213828.GB13339@kunai>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> On Aug 2, 2020, at 2:38 PM, Wolfram Sang =
<wsa+renesas@sang-engineering.com> wrote:
>=20
> Hi Daniel,
>=20
>>> +		__u16 len =3D recv_len ? msgs[i].buf[0] + 1 : =
msgs[i].len;
>>=20
>> This is post-ioctl()? (Sorry, still not familiar enough with =
i2c-tools.)
>=20
> Yes, read buffers are only printed after the ioctl. And 'print_msgs' =
is
> probably the most complex function within this tool :/
>=20
>> It isn=E2=80=99t wrong, but shouldn=E2=80=99t be necessary.
>> Unless the adapter driver you=E2=80=99re using went astray. Not =
ruling that out.
>=20
> I have just checked existing I2C_M_RECV_LEN handling. Quite some =
drivers
> do it wrong. And there is no consistency in what they return. Lots of
> things to fix there...

Would be curious about what variants are there.

Note that msgs[i].len isn=E2=80=99t updated, you only get <extra_bytes> =
of data back,
so the difference would be severe: msgs[i].len is what guides =
copy_to_user().

https://github.com/torvalds/linux/blob/master/drivers/i2c/i2c-dev.c#L301

Daniel

