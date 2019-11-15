Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 871B2FE77A
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Nov 2019 23:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbfKOWQC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Nov 2019 17:16:02 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:39046 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726766AbfKOWQC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Nov 2019 17:16:02 -0500
Received: by mail-oi1-f193.google.com with SMTP id v138so9989470oif.6
        for <linux-i2c@vger.kernel.org>; Fri, 15 Nov 2019 14:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VrwTiEGJlLLo81xG+S86aYgrEKB8cGFUXed3sRPs9qE=;
        b=eB8wJcgdGhhyBcAt4UQTmjUOGFBU7OkqAgrkZGfp8JozZCZkqY7OROEpsordbzwzkv
         4JIF00v4yJzmsVdFuOzdcuDEyz6VwbuPAdUduqa0BP03Z29k+PaI5bKdwzprwRrhaEd7
         CFbNQJCtm3tgoBjrDWvh2rcAk8/kXJQPKxGy2F0YMxCNZSkqc0LJJoI13QgjwUXxFG1T
         dugHUvn4F6sZlojrwJ/Y4pV+4r02QoSupqvcMZqqjY3c64cp3fFPY3umkKOsnOwk5V2I
         4Rk3UMl6TSTKrs/HyxjepeXidehTuL/tLldnFiddeh/UERCEZNaLx6uWsfVdloHZf/mz
         o4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VrwTiEGJlLLo81xG+S86aYgrEKB8cGFUXed3sRPs9qE=;
        b=GTMq0LHlID5YRb1xSnUF25YmN2Z+I34wZmayiG/qdO64qw8X7uMjgazSGN9EoTdYiI
         YoW+vfriNa7IL3Fx6etqbUkoDCorMQA0X9JXiQSU2A7KOkHNA8ITxuXYQ/3DP4I8fw3+
         b6oVxTXItMYlQxhtipQh8jMveY5ssFBSrjMxJKkIMx6lY2Ossqh16DsyO6SBCokCz/GO
         9i/CX5zHPq3jjTQzpLX+B+gLbSCPv4ZUfjfRZXPlYZx8avdotyd/QKKf9f5b3zxHO5XA
         zrFTVG7b3oIVzmTSpJXChRG2kj5ojFIptNdPnNbzA0AuWZyTHKrRkjIVAPJ/UBGcF3Ek
         m/8Q==
X-Gm-Message-State: APjAAAXVIwjI7pXK8Ms5k0KtlYk5eGtUJcyyo69egAWrdj8Pd5FLWAzc
        CUQJsxJAaZjN/uBOEKVwEVemU7fIOn6fr4YrAQuecQ==
X-Google-Smtp-Source: APXvYqy7mAtMxI3Pn+9esu39unW7sjkUaLc6FCEsywtYoQXoGbpJVLJ1jrXK/jfSSxC3nmtTbth86MiAe0XIzLcH//c=
X-Received: by 2002:aca:f514:: with SMTP id t20mr9577132oih.24.1573856160984;
 Fri, 15 Nov 2019 14:16:00 -0800 (PST)
MIME-Version: 1.0
References: <20191115045049.261104-1-saravanak@google.com> <20191115053201.GA800105@kroah.com>
 <20191115091035.GA2227@kunai>
In-Reply-To: <20191115091035.GA2227@kunai>
From:   Saravana Kannan <saravanak@google.com>
Date:   Fri, 15 Nov 2019 14:15:25 -0800
Message-ID: <CAGETcx9isTDaRW0KgdWVHxxTKdERB4DPeQyCa9QWXniNTpuZ_A@mail.gmail.com>
Subject: Re: [PATCH v1] i2c: of: Populate fwnode in of_i2c_get_board_info()
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Android Kernel Team <kernel-team@android.com>,
        linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 15, 2019 at 1:10 AM Wolfram Sang <wsa@the-dreams.de> wrote:
>
> On Fri, Nov 15, 2019 at 01:32:01PM +0800, Greg Kroah-Hartman wrote:
> > On Thu, Nov 14, 2019 at 08:50:48PM -0800, Saravana Kannan wrote:
> > > This allows the of_devlink feature to work across i2c devices too. This
> > > avoid unnecessary probe deferrals of i2c devices, defers consumers of
> > > i2c devices till the i2c devices probe, and allows i2c drivers to
> > > implement sync_state() callbacks.
> > >
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > ---
> > > The of_devlink feature is present in driver-core-next branch. It started
> > > off with [1] but it has been improving since then.
> > >
> > > [1] -- https://lore.kernel.org/linux-acpi/20190904211126.47518-1-saravanak@google.com/
> > >
> > >  drivers/i2c/i2c-core-of.c | 1 +
> > >  1 file changed, 1 insertion(+)
> >
> > Wolfram, I can take this through my tree now if you have no objections
> > to this.
>
> What would be the advantage?

Of the patch or of him picking it up?

Advantage of the patch is in the commit text. Details of of_devlink
are also provided in the link I gave earlier.

Advantage of Greg picking it up: This patch will get tested/seen with
the set of changes (of_devlink) with which it'll have the biggest
functional impact.

-Saravana
