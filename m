Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59FFA2CC9DB
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 23:46:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387534AbgLBWpi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 17:45:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729017AbgLBWph (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Dec 2020 17:45:37 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 175FFC0613D6;
        Wed,  2 Dec 2020 14:44:57 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id f190so792273wme.1;
        Wed, 02 Dec 2020 14:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vdTl/tO55LNkeiiltDbdm9E3cNr4surJ/KWqPgGlQ+w=;
        b=FhpDMy4U0u3jnxgW7ug36N7+Jc6N/+ASAARIqCwhJYxHYeEYlC0rcX4JZvUc0A7Fa5
         GDe225eJML3Jf55abQojZyeS7bwIto2KD8Qq7iqMFDR1cLdinOzP3Bwu7GGoGUbiHEpn
         7se+JIkDr4xlPisgATpeYSXnbJJkTUKm12H7rJKdWOyEeR94fWvbkv7xMwPXK5YjzV/G
         9BehnW5BzUgQ7ZDo79hh5W74Jv3TK0aSWzFBkk3nmCTEoDKHJPZVTSOSpIPWsuCOGJXL
         a1FSTNLpGtAwnOUcY0fxnSq/SuESJRrzZ7I+GLJc8pX4HtJBd3lW4vOnXdKLlyDQjlWs
         FMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vdTl/tO55LNkeiiltDbdm9E3cNr4surJ/KWqPgGlQ+w=;
        b=OJsI9U+7jmr9q1wcnGgldw8xCI+raE4V20ZNNO1hU8Hjt9n9lo+TucW82ewUzPa406
         2h96u46Pcx4WUty4BgjK6/MDxzw+DOKxkEi2t5YWsfA/+6xr2qZqmW8/kf7CLBD9Mqa8
         eUMPmlkyIG3oHaUo6aWuHOM8tWBwraL17XR2jau14dKxwpkHVkbm5ujkQlP7ubYS13IF
         RCXcAGZCa1U0CZv96ZHG/i/Qtdnub4MqfcpUezIym156bEozbj3KiK9tmet7MFh4C+Lc
         DSfY9VpS0IN+fOvwEkEqdDNJ9RW6KdNn5qVVrAvaFJC2mYpb/AHZKp4JZvmjm6n8kIjT
         fjug==
X-Gm-Message-State: AOAM531oCDFSmDTKDVlKC3ljutgxK3eG07m/MbrEunukJIINp8eSrX1T
        qhMxNsCqHASz4+TfCjukBok=
X-Google-Smtp-Source: ABdhPJw/qp3tZp0seRrB7VFgc+jnjawf1eKT0qM8T9Hp1F9XpQyy5E1DLpO2yx8CD1WGeC+2RhDYrg==
X-Received: by 2002:a1c:9d8b:: with SMTP id g133mr143249wme.189.1606949095868;
        Wed, 02 Dec 2020 14:44:55 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id h20sm244946wmb.29.2020.12.02.14.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 14:44:55 -0800 (PST)
Subject: Re: [PATCH 13/18] ipu3-cio2: Add functionality allowing software_node
 connections to sensors on platforms designed for Windows
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-14-djrscally@gmail.com>
 <20201130170955.GN14465@pendragon.ideasonboard.com>
 <b5cc6bbd-f679-7023-fde0-de2acb65a3c2@gmail.com>
 <20201201223053.GB4569@pendragon.ideasonboard.com>
 <20201202103851.GC852@paasikivi.fi.intel.com>
 <cb68e265-0e6c-4079-e835-f004e6a46dfb@gmail.com>
 <20201202120251.GB4077@smile.fi.intel.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <7c74abe1-bc42-2eec-e7f8-9f51fb99820f@gmail.com>
Date:   Wed, 2 Dec 2020 22:44:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201202120251.GB4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02/12/2020 12:02, Andy Shevchenko wrote:
> On Wed, Dec 02, 2020 at 10:53:05AM +0000, Dan Scally wrote:
>> On 02/12/2020 10:38, Sakari Ailus wrote:
> 
> ...
> 
>>>>> Argh, thanks, this is the curse of using VS code on multiple machines...
>>>> I recommend vim ;-)
>>> What is VS code? Very Serious Code?
>>
>> Visual Studio Code - it has some nice features, but the
>> facepalm-to-productivity ratio is a bit high.
> 
> Perhaps you can submit an issue report on GitHub. I found VS Code pretty nice
> to be with Linux kernel development.

Yeah I like it too; it's the one I've stuck with despite the annoyances
I find. It has some super handy features for someone who doesn't know
most of the kernel APIs very well yet. Writing up the issues is on my
to-do list but I hate to do it without at least putting some effort into
figuring out what the problem is and I so far didn't get round to that yet
