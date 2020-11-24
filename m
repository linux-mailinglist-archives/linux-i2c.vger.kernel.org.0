Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E4FA2C230E
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Nov 2020 11:35:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731893AbgKXKfP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Nov 2020 05:35:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35941 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731852AbgKXKfO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Nov 2020 05:35:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606214113;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ncyxnNig+ZEOG1TiXd1E2PXEyV1aiFvSS2DGZ2RVKgo=;
        b=FiC3VW9ejNZ5x2Yq0gnkweW2GjTdlutc5vF+ssmywNQk3FBzxZMfsjSrIkq5kg5gLIx3cU
        gNIgZ73fieg5pEzkabfPB1Q89TSivlgyymukkqsAVtKxm2107OmHfYg2xcpiJ04RmLHIep
        ZM7+C9PmleG8UVtYpwvgPGAX535shf8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-nsu7KTNpPdi2DqOYpuyazw-1; Tue, 24 Nov 2020 05:35:11 -0500
X-MC-Unique: nsu7KTNpPdi2DqOYpuyazw-1
Received: by mail-ed1-f69.google.com with SMTP id bu17so7701285edb.22
        for <linux-i2c@vger.kernel.org>; Tue, 24 Nov 2020 02:35:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ncyxnNig+ZEOG1TiXd1E2PXEyV1aiFvSS2DGZ2RVKgo=;
        b=ZwNap/lQQivtOA/vrjyiUcUIhqnfaI7Wuu2Hw7f/HRxN3VsmxWNaxcieVhSX0/lGJm
         T0CxaveN4ybKYZBIgqmqB4R8BGVHOgoEOyQTNPNwoA3K9muJVpUgUx/Vs9exA249//UT
         xPMshwm5k8R71T+k3g/7cUn+jVnPxOHzZITc3zhR+6hKCysxekHAzEaWf+bVdDrnyCeq
         fFYwbYPjsd/9flHACiDRhsCLpc90elkl5hp/Hr2SbHUirAyPZigS1JqJOcqUtT9QQE4t
         ImnEeR7lK2CBK/cTdt2EV4+ZWl61xbeG0RaPXMpvDi2y7A9+U9+qCUGVXhVkEUN08OIZ
         C4ug==
X-Gm-Message-State: AOAM5334JpvIPUYtsBSZGQReEzv/UfDxNl5ME0qd8VyJbBskVul2IgIA
        zH4TF7GIAWKi/EZ+mEQrMYCJJYnD22lTMw+E+F5Ly5mHAhztyBuw2IZIc2NZhLzUe8XbzMfoWao
        l23ioNLFiTIVqznNk7+lI
X-Received: by 2002:a05:6402:b28:: with SMTP id bo8mr3374331edb.57.1606214109777;
        Tue, 24 Nov 2020 02:35:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJww75UcJuDu23/qq8PN8EPlsRe/LUlPntcUDLlzHy7PQOmwrc9s7a8WlK+zwyeTKw3R7j9JyQ==
X-Received: by 2002:a05:6402:b28:: with SMTP id bo8mr3374314edb.57.1606214109627;
        Tue, 24 Nov 2020 02:35:09 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id lr17sm5262571ejb.43.2020.11.24.02.35.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 02:35:08 -0800 (PST)
Subject: Re: [RFC 0/4] platform/x86: i2c-multi-instantiate: Pass ACPI fwnode
 to instantiated i2c-clients
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
References: <20201105080014.45410-1-hdegoede@redhat.com>
 <CAHp75Vdm4PuQpAMj98wJZoNMwV2tFGPj-r9ezvXyWCYj2cSuaA@mail.gmail.com>
 <81343662-aaac-a5e8-af86-1370951ff646@redhat.com>
 <CAHp75VdbHPwnOAUWjSN+HuVsWVb=8EUwfWNR1onL9QNrX8yU0w@mail.gmail.com>
 <6345eeb9-8416-3e7c-e619-632b5d4abbbd@redhat.com>
 <CAHp75VdcG_qDpJoppc3Ri8y0rjL9m07r9Xb4JPu30HE6TYf9zQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5f9b0957-fd18-3ad3-79e0-2124edd7d434@redhat.com>
Date:   Tue, 24 Nov 2020 11:35:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdcG_qDpJoppc3Ri8y0rjL9m07r9Xb4JPu30HE6TYf9zQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 11/10/20 3:47 PM, Andy Shevchenko wrote:
> On Tue, Nov 10, 2020 at 1:14 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 11/10/20 11:10 AM, Andy Shevchenko wrote:
>>> On Mon, Nov 9, 2020 at 1:33 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> ...
> 
>>> I think in general the direction to switch to fwnode is a good one. I
>>> was thinking about moving i2c core to use swnodes in which case they
>>> will utilize fwnode pointer. But it might have complications, you are
>>> right.
>>
>> So do you agree to just keep this series in the archives (in case we need
>> it later) for now ? Or would you still like me to post a non RFC version ?
> 
> If nobody else has a different opinion (Heikki, Wolfram, Rafael?), I'm
> fine with it to be in archives for the time being.

Since no-one else has responded, lets just keep this series for the
archives.

Andy, that also means that there no longer is a reason to hold of merging
your i2c-multi-instantiate cleanup series (minus patch 3 as discussed),
so I've merged that into my review-hans branch now.

Regards,

Hans

