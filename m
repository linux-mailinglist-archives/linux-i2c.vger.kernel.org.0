Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 248F323AE11
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Aug 2020 22:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbgHCUZV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Aug 2020 16:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgHCUZV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Aug 2020 16:25:21 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F273C06174A;
        Mon,  3 Aug 2020 13:25:21 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id x6so5555247pgx.12;
        Mon, 03 Aug 2020 13:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=j3tERtreqtW2VPVqPH/Pu4p3CITUiLyYbJzY4/aHR/s=;
        b=NNkKwGzqWcSu5nH7vsSnTyUYGbUIkiP++LLfxIcPf+BC5Hw1CWS3tpi3n67nzpPYWN
         Xm0TLzYzomG9h8Nst6jcrDWhTk33PNbdKyih+wLU1DibqHq8QKgV7wd+NTY/g7UM8a63
         J0KZZoiL0XfY9sNv5eBi/HoYjMVwozvJnXfbbBNQ2vgKi+qFXtLC1KCbnTrx2Xttwszz
         epnxv9hInqKAMXZhPuy10M6dB4RpiJjQs3vsQXYpZoycv1mQC505CF9m8wpS+15KHTT1
         A2QVnn27h8re0lApCSrOdLySwrlqvYp1q3mP+f7VNYEf3LV7iAsrDz8plqku1HebeBlK
         JzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=j3tERtreqtW2VPVqPH/Pu4p3CITUiLyYbJzY4/aHR/s=;
        b=fGmyYACIPR7yassV7xZnLZt8ST9Vmtxtv5lJs5mZDp0M45QBOxw2LGK115qmEx9wX1
         HINbiRP7lIC/pG7QqN1a/AmCf/6JFnN6PJqanM+k82S/7//uIZzeHwQLoHpesRtxT+FL
         g6qIBAX94i5qOLemxs6TVcA+BptVndbNMzoR6tj+Dd87aqy6OkgCgG7vKBh+C++Wpmik
         qI2NUOqYL5Zr26Z5tjP/VhRXKH2RkJQTxYrsVmoOZW9AtvZ9PbijwOV3LdzYLbL4PMRO
         m/H7orWuzIuTfiUWtBE91940YiFQLAvqZ9aMgrpBwuo6wHbW1N0OHLn7yAYTKqM/7wOu
         M9+A==
X-Gm-Message-State: AOAM5318BQY2YTp4DkwnjbVB+qHnSzzNvK3iTxDFvD9EN5DXyhMQwxJ4
        NDc5uFho6n74XYuOT3kyYBY=
X-Google-Smtp-Source: ABdhPJwZ6ap6w5Z+FPByEyWFAgO9jjRnSENlrgrLsA+UZhs3ySSMka+rRgmC4vWE9R7grW1+hEhmIA==
X-Received: by 2002:a63:3541:: with SMTP id c62mr15977504pga.127.1596486320911;
        Mon, 03 Aug 2020 13:25:20 -0700 (PDT)
Received: from [192.168.173.154] (76-10-188-40.dsl.teksavvy.com. [76.10.188.40])
        by smtp.gmail.com with ESMTPSA id b22sm3222818pfb.213.2020.08.03.13.25.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Aug 2020 13:25:20 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH i2c-tools] i2ctransfer: add support for I2C_M_RECV_LEN
From:   Daniel Stodden <daniel.stodden@gmail.com>
In-Reply-To: <20200803083823.GA958@kunai>
Date:   Mon, 3 Aug 2020 13:25:19 -0700
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <34A8CC90-0EED-4DD8-89EF-E1B81B7D6DB7@gmail.com>
References: <20200802192842.13527-1-wsa+renesas@sang-engineering.com>
 <C5EC2F45-41AD-465E-83F9-BDE3640B02AA@gmail.com>
 <20200802213828.GB13339@kunai>
 <C82A0A94-A06B-4D42-B71B-F14D48D5E029@gmail.com> <20200803083823.GA958@kunai>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> On Aug 3, 2020, at 1:38 AM, Wolfram Sang =
<wsa+renesas@sang-engineering.com> wrote:
>=20
>=20
>>> I have just checked existing I2C_M_RECV_LEN handling. Quite some =
drivers
>>> do it wrong. And there is no consistency in what they return. Lots =
of
>>> things to fix there...
>>=20
>> Would be curious about what variants are there.
>=20
> 1) some do it correctly
> 2) some hardcode the new length as recv_len + 1 (or recv_len + 2
>   if they think about PEC). But they don't do extra_bytes + recv_len
> 3) some don't touch msg->len at all
> 4) some also remove the flag I2C_M_RECV_LEN while processing
> 5) one driver always sets length to I2C_SMBUS_MAX_BLOCK_LEN no matter
>   what the device responds
>=20
> ...maybe more, but I gave up.

Yaah. Right. I think I see how this comes together.

If the driver author only looks at __i2_transfer =3D> master_xfer =
invocations
as employed by i2c_smbus_xfer_emulated, and PEC isn=E2=80=99t used =
either, then that
code path let=E2=80=99s you get away with pretty much any msgs[i].len =
you come up with.

The smbus block reads are only looking at msgs[i].block[0] in that case.

Daniel

>> Note that msgs[i].len isn=E2=80=99t updated, you only get =
<extra_bytes> of data back,
>> so the difference would be severe: msgs[i].len is what guides =
copy_to_user().
>=20
> I think you can clearly see what was actually tested and what was =
coded
> after the specs without proper testing (or maybe just kernel-space
> testing?). This is why I hope my slave-testunit helps a little by
> providing a device to test against.
>=20

