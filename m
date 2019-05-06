Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 221DD14759
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2019 11:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725981AbfEFJQf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 May 2019 05:16:35 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:42374 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbfEFJQf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 May 2019 05:16:35 -0400
Received: by mail-vs1-f53.google.com with SMTP id r62so890889vsc.9
        for <linux-i2c@vger.kernel.org>; Mon, 06 May 2019 02:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0s6BeiWUkkr28Y5KLW3ZXyXusP6znFQn8Y31zYB/p08=;
        b=S5UfbxYGdw79UNqNNES9nOwDzTeQXnlmr3kZTTElok3nDzxl35gW8ECyoSUKw97BLU
         DpBQaqA82bivDjgWTMAg/jBY8UUfJ6mF++0oOkq+9KxqHKv9ltVg/fU+ypySinGo11A3
         VmzAXQW8B+QnluXeiWybv1NoWghekqr+5B/f3ln1nIdQgFLJrEnQ4cmZR8lGNSn6KKwp
         28v3vl68yZsI7iEgcCBxSP046P6BZ13A5lowwNzNERcA6vLgigE6aImA342MAUkyAcIA
         EqQDJa07rJdH/uGiToQQL98oOoB4YQLlEhwK0o+rQxeICMkgyLp8GDcwmtz0TjrOuj5k
         L2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0s6BeiWUkkr28Y5KLW3ZXyXusP6znFQn8Y31zYB/p08=;
        b=qQPTmIz6NYbwdlRobNzzwwaEM12GOMpsI0HAcSczjrL7VFc6ITn47hDh+QAfd6wKk8
         32qzb28aC4vFfLNmutzOnCHRfTTkMQJE62SYv4GbXWKL8LzrCXYwV4HN5AmTXBf3zrt1
         TV4Ac13ZcxzfFH/JrUrIdHSBr3+084euP8TUQFQI8Ief7oO+WSlOpejtO7K3tblF598y
         u4M+/mDIfh9uvLaQ37HkAVoUUW+dTfQMjAod6njhSIYLXlsZlkm5Wt1N4CcuLitB+8mC
         aNYOVdONLfAMLKdsZGEKFL+6WQwAJefAcb9aGXH3GQET6MGVwMaofEJrh3NmiFyGooyw
         F2tQ==
X-Gm-Message-State: APjAAAW2jGVKmYW5ywf+Wznz0w2aDdNjUsP7NswkE2z44QCCHtazwEdf
        e1VVpI4jLQLyQIqH+pXfVsv0szdUD6uqIjbBY4Q=
X-Google-Smtp-Source: APXvYqyOrIf8YxknBftLWftEoKUX8kPyBBjarxNcqHZEUJ1VV/VI0uits6KHn6GIeR+WnUHzyC9hUS/WA11mR6iBx3s=
X-Received: by 2002:a67:83c5:: with SMTP id f188mr12292496vsd.163.1557134194315;
 Mon, 06 May 2019 02:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAN39uTqhOxGSFvPsvZawBD-7kPLo9j0ONNYNyADXP9yqqwHEfA@mail.gmail.com>
 <20190411201628.4e7521a3@endymion> <CAN39uTqoWxJDFtVH6hzk5uSeqS-szOn8FfPs8L7s6Wray_1BdQ@mail.gmail.com>
 <20190411211239.440d71f1@endymion> <CAN39uTrd4zw+mWa=zSjZF+zNH-B1B2+YwO_4913FDP56iQNb9w@mail.gmail.com>
 <20190412164325.0b410662@endymion> <CAN39uTpx+daGd1w6k=sKQMQzUSJqvQxYLaD96fszap2=w63qVg@mail.gmail.com>
 <20190412204203.69f4a4be@endymion> <f1e9c190-7956-25c3-8e99-3a2ec100fd1a@linux.intel.com>
 <20190415152441.451c0e66@endymion> <CAN39uTqWDpRYOyHWfcEMoamPPuFJXFZwgYpMVDM4-aTz5yicOw@mail.gmail.com>
 <20190416165946.48059d1c@endymion> <8052f568-32ab-7104-b9bb-7bcb07179a6c@linux.intel.com>
 <20190417174002.651974bd@endymion> <06a90410-851f-618c-c203-ed3fc414ea18@linux.intel.com>
 <20190419203909.2b8991a1@endymion> <CAN39uTp_NTiUB_ZbhZkYQia3-YC0on_A5g87mt8T4uBYsKkb9Q@mail.gmail.com>
 <20190419223118.28b70421@endymion> <bf2a2dce-694c-db9b-e91e-deae4051d44b@linux.intel.com>
 <20190506110646.55cfc6ca@endymion>
In-Reply-To: <20190506110646.55cfc6ca@endymion>
From:   Dreamcat4 <dreamcat4@gmail.com>
Date:   Mon, 6 May 2019 10:15:57 +0100
Message-ID: <CAN39uTojOZg-LYs9JOxAart2gPU37VQpvfB6PDoVvypPfcSWLg@mail.gmail.com>
Subject: Re: [decode-dimms] Crucial Ballistix BLS2K16G4D30AESB, cannot decode
 / understand timings
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jean,
Here is the output you requested

[root:~] # sudo modprobe i2c-i801
[root:~] # sudo i2cdetect -l
i2c-1    i2c           NVIDIA i2c adapter 5 at 1:00.0      I2C adapter
i2c-2    smbus         SMBus I801 adapter at f000          SMBus adapter
i2c-0    i2c           NVIDIA i2c adapter 4 at 1:00.0      I2C adapter
[root:~] # i2cset 2 0x36 0x00 0x00
WARNING! This program can confuse your I2C bus, cause data loss and worse!
I will write to device file /dev/i2c-2, chip address 0x36, data address
0x00, data 0x00, mode byte.
Continue? [Y/n] y
Error: Write failed
[root:~] 1 #

& thank you for making these upstream patch(es) for this. Kind regards

On Mon, May 6, 2019 at 10:06 AM Jean Delvare <jdelvare@suse.de> wrote:
>
> On Tue, 23 Apr 2019 17:55:54 +0300, Jarkko Nikula wrote:
> > On 4/19/19 11:31 PM, Jean Delvare wrote:
> > > This was only for testing... I'll post clean patches soon.
> > >
> > > Thanks for testing so quickly, appreciated.
> >
> > Your updated ee1004 driver works here too on 2* and 4* Crucial DIMMs
> > cases. I.e. decode-dimms is detecting them and outputting sensible
> > looking data which was possible before only when both 2* Crucial + 2*
> > Micron DIMMs were plugged in together.
>
> Thank you Jarkko and Dreamcat4 for all the tests so far. As I was about
> to send the patches for upstream inclusion, I noticed that the driver
> doesn't actually use the SMBus command which is mentioned in the EE1004
> specification to select the page. The driver sends one dummy byte after
> the I2C device address, while the specification says to send two dummy
> bytes.
>
> Well, to be honest I can't see from a technical perspective how 2 dummy
> bytes could succeed if 1 dummy byte fails - I assume the NACK is sent
> by the EEPROM after the 1st dummy byte before it has any idea if
> anything is coming next - but to be on the safe side, I would
> appreciate if either of you could try the following command with the
> "failing" setup (2* Crucial):
>
> # i2cset <N> 0x36 0x00 0x00
>
> (where <N> is the I2C bus number of the i2c-i801)
>
> If it still fails they I'll submit what I have. It it does work then
> I'll write a different patch.
>
> Thanks,
> --
> Jean Delvare
> SUSE L3 Support
