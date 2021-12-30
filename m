Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC26481EF4
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 19:00:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236976AbhL3SAh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Dec 2021 13:00:37 -0500
Received: from mail-qt1-f172.google.com ([209.85.160.172]:43807 "EHLO
        mail-qt1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236001AbhL3SAe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Dec 2021 13:00:34 -0500
Received: by mail-qt1-f172.google.com with SMTP id q14so22318094qtx.10;
        Thu, 30 Dec 2021 10:00:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=wP8VaC2um5RETqXxfe7yZ3kX2wFveb1qZknd4yKdx7o=;
        b=iaApA4NJQxX8zcgAv3DQrhkkw7i6CSOySicXnOAmC0KiXzOUK2atWP7Tmr+tkUnen/
         MO2Msvgnc7wEzA5eqOXylBDSyJG8QKyLvhzMBXK7S1S9besZdsYMJWnfcktMInaB+0YX
         iojAmV/OeZKryzhXxRexTnFOONAiDDdUO292P2IcyHViLpctU2T8X+zzcSDnd3XeFGKx
         a7fV0X883ea+cd8HIM0l0HzSGg8i/FTFFWyZcctNYgXIpMH/bcKtaWNK5bMtK/3NxTt9
         XOvOUa+RZXRPZhn6cB/xY/VVwRJag5WFWv/+xVEPnJdrEk4TCpz5T6drBtxM/x6Wkcbm
         5a7Q==
X-Gm-Message-State: AOAM530+9XPTvzTiH1ue3UdEpZWWuVV0I5siz8IDBf5SuRy+dP1epaTR
        izQePYBGyOWs6i7FD86fgG8iW4y+qQVzvOlcvy36ygyq
X-Google-Smtp-Source: ABdhPJxBmZgubFeqQI9Vzd9bzky5rV2PA7iJoC+4/3G03QMrKcFOQnFDiCdiutBVhbt5IZS0bNHkkmZqOFm5eCmpYMw=
X-Received: by 2002:ac8:5c91:: with SMTP id r17mr28412217qta.18.1640887233634;
 Thu, 30 Dec 2021 10:00:33 -0800 (PST)
MIME-Version: 1.0
References: <20211230141722.512395-1-hdegoede@redhat.com> <20211230141722.512395-2-hdegoede@redhat.com>
 <CAJZ5v0jw7jNq8FgMFcF9p=YYiuYj=RuV2MTPqGu62QoaG_O1MQ@mail.gmail.com> <Yc3ytI/NxnGT0aVf@kunai>
In-Reply-To: <Yc3ytI/NxnGT0aVf@kunai>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Thu, 30 Dec 2021 19:00:22 +0100
Message-ID: <CAJZ5v0jyHamePb+J-5JGFPOErzV0Vq1TCD=Yq83hC6eSccCFOg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ACPI / x86: Add acpi_quirk_skip_[i2c_client|serdev]_enumeration()
 helpers
To:     Wolfram Sang <wsa@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 30, 2021 at 6:56 PM Wolfram Sang <wsa@kernel.org> wrote:
>
> Hi Rafael,
>
> > or please let me know if you want me to take this series.
>
> Yes, see cover-letter :)

Oh well.

I'll take it now, thanks!
