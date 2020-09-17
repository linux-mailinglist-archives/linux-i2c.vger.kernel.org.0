Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66A8C26D943
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 12:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgIQKkP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 06:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726604AbgIQKj7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 06:39:59 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B6A0C06178B
        for <linux-i2c@vger.kernel.org>; Thu, 17 Sep 2020 03:39:58 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id q8so1638431lfb.6
        for <linux-i2c@vger.kernel.org>; Thu, 17 Sep 2020 03:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=hf2P5/+cpeK1am79y/RoRQqvbHQaJG9hFBeQCwWUWOM=;
        b=U9MdaVPiiyO8jb5u8jziyY1X0KSDvAmjNg6PGJyIJgfbjDhbWAEP4y1CwOkbNijPnN
         xoMvXXmkLc009O0AQ0Bu15MKwNoWYfRdhwMrfW1DBT2sTVmdSmrPmTH1HZglxYUTcQ8A
         MpIWuOPrFuvHaZmeMcWkI7NKxZIEU/bleoToE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=hf2P5/+cpeK1am79y/RoRQqvbHQaJG9hFBeQCwWUWOM=;
        b=nTAcoi12+KQJGEdXnzEUb0aLvwm+jsTx6z1UJz4Htl9hIh8e3rJm90aFVWKGhVaLSm
         ZPCuA+pShWQqnA93J9PQ02PA33kI2crCyb17poeDHD90IWsNEYs0LX23M04w+8GE8jjy
         EaeC7YIHLFEwOmmgPG2hgcYN3jcuUnBkpu/jyTsdK+4Bs8nrDeB7YdYIJHxCqRLDBUl8
         kZYRVIpWiVJ1njruC2F78YPPsC1BFjRLUI+Q4XzFd+DlClSPTHfyDLLjSdAdwV0ci4C3
         AEp3j8tiRGUA40UAMClhsumLUFNOHLa+tyOXnjI8mg7bn8TvU22zFoaApTVQ7SqbQ+38
         hXqw==
X-Gm-Message-State: AOAM533lPePBd6pNgUzIVkezRJkJz3pseP/9/PClHRqhSU2W6q7tivGs
        g7Tnt+mcIDCbLZUzk8pumXRybp6CXgFn3lCFNlbBaFTwWeM=
X-Google-Smtp-Source: ABdhPJzXEDfaHYGObAOf2iphXEUaPqVa1TRB/dpgorz6Y5byHjetugopDMJN/K9SD4ljmUAj7r6Mmebij8Jk7xspf7I=
X-Received: by 2002:ac2:520f:: with SMTP id a15mr8263218lfl.546.1600339196477;
 Thu, 17 Sep 2020 03:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAHO=5PHaJbNxQk3DN0wxD0ZaftrQDe4qMZc4L79vgwQpjHL8qg@mail.gmail.com>
In-Reply-To: <CAHO=5PHaJbNxQk3DN0wxD0ZaftrQDe4qMZc4L79vgwQpjHL8qg@mail.gmail.com>
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Date:   Thu, 17 Sep 2020 16:09:45 +0530
Message-ID: <CAHO=5PGaNjJoC1ttN6fayFyedyDWmYaTr5XkTfRSMD95NaPZJQ@mail.gmail.com>
Subject: Re: Question on SMBUS slave transmit with PEC enabled
To:     linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 15, 2020 at 2:47 PM Rayagonda Kokatanur
<rayagonda.kokatanur@broadcom.com> wrote:
>
> Hello All,
>
> I have the following questions wrt SMBUS PEC support on the SLAVE side,
>
> As we know when Master sends a read request, Slave keeps on
> transferring data until STOP/NACK is received from Master.
> This means Slave doesn't have a prior idea about how many bytes to
> transmit to Master.
>
> Let's say, the Master wants to read 1 byte of data with PEC enabled,
> in this case Slave needs to send a total of two bytes (1st byte data
> and 2nd byte PEC).
> When Master puts this request on Bus, following events will happens,
>
> 1. Slave sends 1st bytes
> 2. Master receives 1st byte and sends ACK
> 3. Since no STOP is received from Master, slave send 2nd byte (But
> Master is expecting PEC bytes as 2nd byte)
> 4. Master receives 2nd byte and sends NACK/STOP.
>
> This means Slave didn't send PEC byte and is no longer driving the SDA
> line to send PEC bytes.
> When Master checks PEC it will not match and Master read will fail.
>
> How do we handle this case, what is the expected behavior from Slave
> as per SMBUS protocol ?
> In this case when should Slave send PEC bytes ?
>
> Please let me know.

Please let me know if anyone knows the solution for the above problem.
Or any other forum to ask this question.

Thanks,
Rayagonda

>
> Best regards,
> Rayagonda
