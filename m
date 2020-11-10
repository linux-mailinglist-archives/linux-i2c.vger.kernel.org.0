Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADF3A2AD926
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Nov 2020 15:46:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730980AbgKJOqW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Nov 2020 09:46:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730200AbgKJOqV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Nov 2020 09:46:21 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3933C0613CF;
        Tue, 10 Nov 2020 06:46:21 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id v12so11604022pfm.13;
        Tue, 10 Nov 2020 06:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KITGRMBYhTUWHO+ezTykdgzNgM9ljTy95ViqgbyHuDQ=;
        b=vb0RgcDzrG+Z0XhNvhZ0EEKcPWfQwUiDzsG5GnDh7YiaOPnrIM/yyWTyVKY30l+4JJ
         2So3b/4gnBs+Gi2/VPB4mk72c52rEWzel8oYnPYQgKz5VtO0KDGvVuvXev1aqRlGMs4V
         f1lmnpZAoHznDkzNdhtJrawy7+xp/BjZme/gLXtQMfg7SHNDH/g74Vze3YkdbnhbXyhV
         vtnHn2vFco2DzIA0OsvIl/fdGy/+uTVMk0u+t9SWOcoN4WGpTKkzFQCForM5z7euocbi
         sL+1H/ZJJMwyl6akpNxK5kniXXneTYtHohj3AYowDumJChiq0s7lI562G2oYnfyfyYBC
         w6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KITGRMBYhTUWHO+ezTykdgzNgM9ljTy95ViqgbyHuDQ=;
        b=HmK6DTJd+5tZlKu6/KtrS2AseKBsWYcjTOavdOipiaYQ+Qt8SEWAq7SG4xLvU7C977
         DPPPUgS7K3IcgfkDqJk2OL1eW265A/rtHkSd4cDVXJWhenLuqm9y580dbJ7sG5weCAq1
         oGtJ9PGcIZlfOBvEnFFBLy9YW6VMdcyeWIQ/ML9Rq41nTuDdH3GqIaBwNUIeEqKqsMY6
         q+8KD0eiJkBzCxddWx9o2qrmTjWD07fQCnmU+SFxobUuxUPXj9llpGg0NXwZWFrU75My
         uUxrY8Aw+heOzbep1T7UABL58yWxeXkc3VBC2XPvwoaXb0msMCteTWxcAcQejTkucupE
         2R7w==
X-Gm-Message-State: AOAM533dD1kQ904wPWD6ANc//DQigjr0fN1JiMP8O424FfRGvm8VyJKA
        SFU+lS3J1b7CFVDploiXtEiZ0HlfV0dB95RNoQM=
X-Google-Smtp-Source: ABdhPJx0BQailDKwRbiTPH2sIvEGj9yDJ58vlJbH6q+HVXBy1YexuaN+u5JSPS4YAu3/D825gIRWpDsOE/iS2s2IgMg=
X-Received: by 2002:aa7:8c4f:0:b029:18b:f361:4aa3 with SMTP id
 e15-20020aa78c4f0000b029018bf3614aa3mr1263957pfd.73.1605019581399; Tue, 10
 Nov 2020 06:46:21 -0800 (PST)
MIME-Version: 1.0
References: <20201105080014.45410-1-hdegoede@redhat.com> <CAHp75Vdm4PuQpAMj98wJZoNMwV2tFGPj-r9ezvXyWCYj2cSuaA@mail.gmail.com>
 <81343662-aaac-a5e8-af86-1370951ff646@redhat.com> <CAHp75VdbHPwnOAUWjSN+HuVsWVb=8EUwfWNR1onL9QNrX8yU0w@mail.gmail.com>
 <6345eeb9-8416-3e7c-e619-632b5d4abbbd@redhat.com>
In-Reply-To: <6345eeb9-8416-3e7c-e619-632b5d4abbbd@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 10 Nov 2020 16:47:10 +0200
Message-ID: <CAHp75VdcG_qDpJoppc3Ri8y0rjL9m07r9Xb4JPu30HE6TYf9zQ@mail.gmail.com>
Subject: Re: [RFC 0/4] platform/x86: i2c-multi-instantiate: Pass ACPI fwnode
 to instantiated i2c-clients
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Nov 10, 2020 at 1:14 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 11/10/20 11:10 AM, Andy Shevchenko wrote:
> > On Mon, Nov 9, 2020 at 1:33 PM Hans de Goede <hdegoede@redhat.com> wrote:

...

> > I think in general the direction to switch to fwnode is a good one. I
> > was thinking about moving i2c core to use swnodes in which case they
> > will utilize fwnode pointer. But it might have complications, you are
> > right.
>
> So do you agree to just keep this series in the archives (in case we need
> it later) for now ? Or would you still like me to post a non RFC version ?

If nobody else has a different opinion (Heikki, Wolfram, Rafael?), I'm
fine with it to be in archives for the time being.

-- 
With Best Regards,
Andy Shevchenko
