Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7CB16F1CC
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 22:49:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729429AbgBYVtt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 16:49:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:41236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728978AbgBYVts (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Feb 2020 16:49:48 -0500
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9CB1624650
        for <linux-i2c@vger.kernel.org>; Tue, 25 Feb 2020 21:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582667387;
        bh=HpOrLqgis/0esfG7dq2+OsTjc76h9zTqkjIJyDQmoKA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gLhc7oCBf/dMrtwgyWAQsXlJBnnS8uxHJFBQTNslU/xlcEZ2XsI37rPDayexTl/na
         fUuMHI7ecFZvcl+kv3tj8ZSXWPVED6uI/6HeAmY/iraqGp56FGYmhadN6drQ3kLQ+1
         Og4aSYroBhGJzgODXVENKVdfI5ISKrI2XKCmFvP0=
Received: by mail-wr1-f46.google.com with SMTP id g3so443031wrs.12
        for <linux-i2c@vger.kernel.org>; Tue, 25 Feb 2020 13:49:47 -0800 (PST)
X-Gm-Message-State: APjAAAWym3UzpadGg9QZVCDnOoikaXVQIYcU5DnMVoigTPLdph3TFkLJ
        qVhLg1tguXppLHx6Kr4o+3QSelIlYHf+B/TyF1V81Q==
X-Google-Smtp-Source: APXvYqwwlguw+9143UoHvRORjuDhvyP7pINZdcLc2/GmTaDHWw6AbKjBqD07WA/Fx7HmxjDN7uHVGZJ80tlj+nocYZ4=
X-Received: by 2002:adf:df0c:: with SMTP id y12mr1116539wrl.257.1582667386041;
 Tue, 25 Feb 2020 13:49:46 -0800 (PST)
MIME-Version: 1.0
References: <1582498270-50674-1-git-send-email-schaecsn@gmx.net>
In-Reply-To: <1582498270-50674-1-git-send-email-schaecsn@gmx.net>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Tue, 25 Feb 2020 13:49:34 -0800
X-Gmail-Original-Message-ID: <CALCETrXcFrR9V_yjPRh9eJ1=1efo_DCCwGTeusmo2CQXpFFdrw@mail.gmail.com>
Message-ID: <CALCETrXcFrR9V_yjPRh9eJ1=1efo_DCCwGTeusmo2CQXpFFdrw@mail.gmail.com>
Subject: Re: [PATCH 0/1] i2c: imc: Add support for Intel iMC SMBus host controller.
To:     Stefan Schaeckeler <schaecsn@gmx.net>
Cc:     linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Feb 23, 2020 at 2:52 PM Stefan Schaeckeler <schaecsn@gmx.net> wrote:
>
> This patch is based on Andy Lutomirski's iMC SMBus driver patch-set
> https://lkml.org/lkml/2016/4/28/926. It never made it into the kernel. I hope
> this rewrite will:
>
>
> Overview
>
> Modern Intel memory controllers host an SMBus controller and connection to
> DIMMs and their thermal sensors. The memory controller firmware has three modes
> of operation: Closed Loop Thermal Throttling (CLTT), Open Loop Thermal
> Throttling (OLTT) and none.
>
> - CLTT: The memory controller firmware is periodically accessing the DIMM
>   temperature sensor over the SMBus.
>


I think this is great!  One question, though: what happens if the
system is in CLTT mode but you disable CLTT and claim the bus for too
long?  For example, if there's an infinite loop or other lockup which
you have the tsod polling interval set to 0?  Does the system catch
fire or does the system do something intelligent like temporarily
switching to open loop?
