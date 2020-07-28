Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DFE5230783
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jul 2020 12:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728697AbgG1KSj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jul 2020 06:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728050AbgG1KSi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jul 2020 06:18:38 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2021C061794
        for <linux-i2c@vger.kernel.org>; Tue, 28 Jul 2020 03:18:38 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id t6so11610087pgq.1
        for <linux-i2c@vger.kernel.org>; Tue, 28 Jul 2020 03:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=okI/a0w/ScKWYlbTYxY5UbnfKpymPj2M1PZmmOAj2mM=;
        b=FUt9V1FsiCEIqcqgeHM683cwEXwh3tDY4qaBOcFoSDUuBdGxlrXJGS9MWPJBTcFKlQ
         YpHeSzRWkopM3MhPhK9YdrbRBIXzYCLJPD7AeOmRUUeJm4c1nk9di41V9tT0SOr4dXW6
         K8IggC1hbooip3Z1jYsHMPm5k0HjHdHJUYEZHTnzn6jb2r7OELsbIMtUVFoeps8COqoq
         /SJ0h8EDxQnRLVEvK9fTBip29YW9oudtsYrnjbU1iMiNIM+aJ4V+xZy3FmCzlm52Bhyc
         c3XJSuM/AOsbEsuLsoJC+bnd+Lzd24G0Av91nOLG8UXWQeE8kM8/1w0ejj1vfO7TGTQw
         KC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=okI/a0w/ScKWYlbTYxY5UbnfKpymPj2M1PZmmOAj2mM=;
        b=jpwpTe2UXd7hhNbqSsRy5Fx7YgjKBWy+tI4+es4V0d6S8JXjzUd4QFxW564Qx0J4Km
         d9LfWM3MfMqfJyDKooNcyIX9q3t9YYSWkIV+0Ln6WIMqrTT+dOaSzfZtcSBcZw9RW6Ob
         zuf0l/5cLiElzRGoNuVfiduTyhAV9fN0iWukOg1W6EgVngAOICbx6cL6mzZ8YEt6s8x8
         FMDwtIG8RGkf2lPjwl+9UmlOrzVQ7Nj1yxTqAe1El5D42zS9khyzNPfLs9OvN02JaVrH
         byuZL4ymR1PT872+yItPSMnL9SAWR3CpEsZ9lusWDr6/OoWm4rPEtYn9+j+jgbMNQKwW
         nhdA==
X-Gm-Message-State: AOAM532hVjWR1mSMADsAkBaDF92IEhNoched4mB5FH2IwR3Ah+cZSVQa
        owMLkslOiui2BVYCEvFozTm/Cg9gVGk=
X-Google-Smtp-Source: ABdhPJwuwOpZhYuhdzJA+RYh4bXFyuD0+MJzElfbzO1bWS8WuOPaLUwEhe5p6rm9YjXSxczjGIoOJA==
X-Received: by 2002:a63:e04c:: with SMTP id n12mr22798579pgj.388.1595931518231;
        Tue, 28 Jul 2020 03:18:38 -0700 (PDT)
Received: from [192.168.173.154] (76-10-188-40.dsl.teksavvy.com. [76.10.188.40])
        by smtp.gmail.com with ESMTPSA id 30sm2750213pjz.24.2020.07.28.03.18.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2020 03:18:37 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [RFC PATCH] i2c: Support Smbus 3.0 block sizes up to 255 bytes.
From:   Daniel Stodden <daniel.stodden@gmail.com>
In-Reply-To: <20200728094037.GA980@ninjato>
Date:   Tue, 28 Jul 2020 03:18:35 -0700
Cc:     linux-i2c@vger.kernel.org, jdelvare@suse.de
Content-Transfer-Encoding: quoted-printable
Message-Id: <88D24A81-513C-4CA2-9AC8-FB156E992F34@gmail.com>
References: <20200728004708.4430-1-daniel.stodden@gmail.com>
 <20200728094037.GA980@ninjato>
To:     Wolfram Sang <wsa@kernel.org>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> On Jul 28, 2020, at 2:40 AM, Wolfram Sang <wsa@kernel.org> wrote:
>=20
> Hi Daniel,
>=20
> wow, that was fast! Thanks for the prototype.
>=20
>> * I suggest to just settle on '3' for new macro and type names
>>   (I2C_SMBUS3_*, i2c_smbus3_*)
>=20
> Yes, I agree.
>=20
>>=20
>> * Block size definitions maintain I2C_SMBUS_BLOCK_MAX (32). Only adds
>>   I2C_SMBUS3_BLOCK_MAX (255)
>>=20
>>   - Means that drivers in drivers/i2c/busses/ default to their safe
>>     32B block limit without refactoring.
>=20
> This is totally fine for this patch. However, I still think I will do
> the renaming to I2C_SMBUS2_BLOCK_MAX in kernel space later. Just so
> people will understand by looking at the code that this is an old =
limit
> which can be removed if there is interest.
>=20
>> -	__u8 block[I2C_SMBUS_BLOCK_MAX + 2]; /* block[0] is used for =
length */
>> +	__u8 block[I2C_SMBUS3_BLOCK_MAX + 2]; /* block[0] is used for =
length */
>> 			       /* and one more for user-space =
compatibility */
>=20
> I thought about this, too, and wondered if this isn't a size =
regression
> in userspace with every i2c_smbus_data getting 8 times the size? But
> maybe it is worth if backwards compatibility is maintained in an
> otherwise not so intrusive manner? Jean, what do you think?

Yep, exactly. It just made for a nice drop-in replacement for me to
focus on i2c-dev.c first.

A lot of clients will stack-allocate these. I suppose i2-tools doesn=E2=80=
=99t
load more than one at a time, but haven=E2=80=99t looked.

Retrospectively
- i2c_smbus_ioctl_data.data shouldn=E2=80=99t have been a pointer type, =
but is.
- i2c_smbus_data.block should have been pointer, but isn=E2=80=99t

And then the kernel would pass around an 32-bit-only i2c_smbus_data =
union -- by value.
Which would have been much leaner, and leave the right buffer choice
entirely to the client.

One could explore this in kernel space. Let me know how you=E2=80=99d =
like to experiment.
But in userspace that means we=E2=80=99re looking at a new call number. =
>:)

Cheers,
Daniel



