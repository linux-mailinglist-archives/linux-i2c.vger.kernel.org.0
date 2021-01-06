Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05CC52EC312
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Jan 2021 19:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbhAFSNx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Jan 2021 13:13:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbhAFSNx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Jan 2021 13:13:53 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ADE1C061358
        for <linux-i2c@vger.kernel.org>; Wed,  6 Jan 2021 10:13:13 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id v3so1924446plz.13
        for <linux-i2c@vger.kernel.org>; Wed, 06 Jan 2021 10:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:mime-version:subject:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=2UU/pYREIRaQhDpwRTKCH5SlQvpJht1A5xQ2tiunYSk=;
        b=XQSmiPSm12smqmUbFBIasc0yM+zu4/OWstf/TDsfGZCZS/7AlSZqxi1k6AmhdfyaKS
         /Xd8x7YbZyioxl69eEdoDGKqKJjNANPvBNYOLoU6wDdC8SNqU7xZdbKqYsdTiISMul1e
         wwbdUYQZr6FeU9ZPNp6TavzcczQs2CVo77dwvYCE+tZvTgHYq99CNlskKdbBr5wc3gpT
         kWos1n5Jr8Dun5UZcE0pFM4VVpDwcuBQmSOaK+zXdtBwhaq0gYMUF3vkWUNc8bvgnIsV
         5uqolHPQ8ea55RoTBjPqQslXBWhco/pcs4pYRKk3YQnueKwOiAbNIpkpmJvFVHVDoUCa
         W6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:subject:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=2UU/pYREIRaQhDpwRTKCH5SlQvpJht1A5xQ2tiunYSk=;
        b=fG/fhe4lbPxWo4Js7t7vpz0WQ14J2umZWqVPO+kQb5bzTww2dWLwzHx74xYDHbkyWR
         qd8X5xH1inAZMBvS11sIxvF/+I5aW9QBNgKeHw33Fk0ArIwlnYH5NpTAJ8kJWS7SwsQe
         Ko8cIe7mfnaKOggJqW2/fybO1Fc/vEko/tHG/8stj/Btcy0cVVlqQIS8gqGA8eCyNTxu
         pyRtoGJdzN5yUlImPey8iSQckkVj7+/ILe8ezwoPPBLCOdI2OgPiSgtFWuwZYmJIKoaQ
         b4Mxd7h1JthlcNHPHTb/0tAMBMDzaGceZbkt19PVjYz0SHSP1rt1wNWCTPYryrpIj2q4
         jckw==
X-Gm-Message-State: AOAM530y7+fqcRZ8B/XoOpdnhc6Vgi3r6CvQCFRO0GidcocmMRC3iHhi
        IkczhYMTs3S4JHCiaw0wnzk=
X-Google-Smtp-Source: ABdhPJwK2ohh3dlbUVhTSBTgUYFa6JIJxbkuh3bjvIhtaI48quTqQdNzQn0p/FcgF76+1cHwctQeAg==
X-Received: by 2002:a17:902:778e:b029:da:feef:8f2d with SMTP id o14-20020a170902778eb02900dafeef8f2dmr5340510pll.25.1609956792658;
        Wed, 06 Jan 2021 10:13:12 -0800 (PST)
Received: from [192.168.173.155] (76-10-188-40.dsl.teksavvy.com. [76.10.188.40])
        by smtp.gmail.com with ESMTPSA id p22sm3656740pgk.21.2021.01.06.10.13.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Jan 2021 10:13:11 -0800 (PST)
From:   Daniel Stodden <daniel.stodden@gmail.com>
X-Google-Original-From: Daniel Stodden <Daniel.Stodden@gmail.com>
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [RFC PATCH v2] i2c: Support Smbus 3.0 block sizes up to 255
 bytes.
In-Reply-To: <20210106152757.GB997@kunai>
Date:   Wed, 6 Jan 2021 10:13:09 -0800
Cc:     linux-i2c@vger.kernel.org, jdelvare@suse.de
Content-Transfer-Encoding: quoted-printable
Message-Id: <78317552-E485-46B4-84EA-625E6E0CBF54@gmail.com>
References: <20200729203658.411-1-daniel.stodden@gmail.com>
 <20210106152757.GB997@kunai>
To:     Wolfram Sang <wsa@kernel.org>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> On Jan 6, 2021, at 7:27 AM, Wolfram Sang <wsa@kernel.org> wrote:
>=20
> On Wed, Jul 29, 2020 at 08:36:58PM +0000, daniel.stodden@gmail.com =
wrote:
>> From: Daniel Stodden <dns@arista.com>
>>   I'm starting to lean toward silent truncate, return 0.
>>   Most permissive.
>=20
> I am sorry, this has been a while... :(

Don=E2=80=99t be, I=E2=80=99m sorry. This came out of a SONiC-related =
project at work. Work
got fixed and moved on. I was originally going to keep this an upstream =
project
after hours, then fell off the rails.

As for v2 =E2=80=94 I still believe the direction is good. The main =
issue I had was that I lacked
insight into one or more popular-enough commodity bus drivers (amd? =
nvidia? intel?),=20
for further verification, as opposed to our proprietary accels around =
here.

That 1->2 succession you outline below, starting with kernel and =
kernel-clients,
sounds a lot like what I was missing.

Daneil

> But now I reserved some time and I am eager to get some SMBus3 =
blocklen
> support into 5.12. My suggested roadmap looks like this:
>=20
>=20
> 1) enable 256 block length in the kernel
>=20
> I will right now start to work on this. Add support to the I2C core =
and
> audit the existing drivers because quite some get block length or
> RECV_LEN wrong. This ensures we have working platforms for testing and
> in-kernel users (TPM) can benefit already. I'd like to have that in =
5.12
> upstream.
>=20
> 2) expose this to userspace
>=20
> Once I send out my first RFC-patches, we can build on top of those by
> adding userspace support preserving backwards compatibility. If we =
have
> this ready for 5.12, awesome! If not, we can still modify the kernel
> interface to fit the needs. 5.13 would be great to have, I think.
>=20
>=20
> I hope you guys are still with me. Especially for the userspace
> backwards compatibility, I'd much appreciate if Daniel and Jean could
> spend some time/thoughts on it. And everyone else interested, too, of
> course. The more eyes the better.
>=20
> Thanks everyone, happy hacking and a healthy 2021 for you all!
>=20
>   Wolfram

