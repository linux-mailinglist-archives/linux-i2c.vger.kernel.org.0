Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72F31331A4C
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Mar 2021 23:40:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbhCHWjp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Mar 2021 17:39:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231228AbhCHWjg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Mar 2021 17:39:36 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BB73C06174A;
        Mon,  8 Mar 2021 14:39:36 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id f33so10866928otf.11;
        Mon, 08 Mar 2021 14:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wQvIDGso1RBFZCsL6ixTOcS0Wu2YsU6EKE/ysPX9/4E=;
        b=ek/lewEGWWKcVBwJKjOEuNn4V/El1kvmO132wgQDs0Nop8NdQDvQwIv9UU4wkRowm4
         olbH+1vBxE7emGSmO1gMGYtgdaz3TdxH2VYQm09srJR7Sdz+v6EiYYb5g/TcGZviL4jx
         Mn61bmIgJ8XnNEUe1t5RhzdRCKJGvZINrNpaTxyy/0H+6DK0H9rTIGxYgGK/em8Ys0S8
         Zwxr+tbMU1qRWh7nyOsA4nKhzMVJX4aFkE6LTmgAs1XCQ5GxPuHaOEbxaBxzLYqTHTF+
         0hQ7Y9mVSmCinX/3jtB0GV/gOGOmDH/EKvHpDYlp3MNRapFnJ08V/2EDb0CDIoZ94JLK
         H2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=wQvIDGso1RBFZCsL6ixTOcS0Wu2YsU6EKE/ysPX9/4E=;
        b=nuuli23HmweWKlyv1M5Po1dQuzHKxMjXG65tVFLClYYUfb8I4GUdyHcs6fvp2yGf5o
         LFkDlpwMkDlg8323c0sIzJDgosx9chEzx640+caIh26uFTWe7HUhC94xx6jBtv012vlf
         NGrgDEvjGEKTJBmVae4LM0jsSB3QdsBkethjcAmC20UFWEZMITNKVpoZgNynW4fH+oDn
         wGcSc14NvJ3Zzu/NAZ9dS3s+PEexCeUYRohQYhBpock1tq3RjNDDUxRa6A5/OrqIKcUx
         cDJBGaEUMl42PicBZYi5Q9PqWNlwTiLajZMjXPTbjLpI3DbJn+8B+bV2E20D2hD0okdG
         ebBA==
X-Gm-Message-State: AOAM5304C2zKbgF2pBwsqp75z+8A9Fw8Xd7B/sJxAAYURcRSoW1lI+j/
        c0kQlsWwxc9puF+HIlfhnbBIdyGtDc4=
X-Google-Smtp-Source: ABdhPJx8XlOlv8RaO6z9FNUkdOHyEa1MxP3s6FTna3PLeU0s6f4ziWS1rVKlVQvp9Mqc9QeAXg4Ncg==
X-Received: by 2002:a9d:80e:: with SMTP id 14mr21846215oty.211.1615243175971;
        Mon, 08 Mar 2021 14:39:35 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h24sm33807otg.20.2021.03.08.14.39.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Mar 2021 14:39:35 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 8 Mar 2021 14:39:34 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: Errant readings on LM81 with T2080 SoC
Message-ID: <20210308223934.GD185990@roeck-us.net>
References: <8e0a88ba-01e9-9bc1-c78b-20f26ce27d12@alliedtelesis.co.nz>
 <96d660bc-17ab-4e0e-9a94-bce1737a8da1@roeck-us.net>
 <4a1b1494-df96-2d8c-9323-beb2c2ba706b@alliedtelesis.co.nz>
 <a67ea323-634d-d34e-c63e-b1aaa4737b19@alliedtelesis.co.nz>
 <5709f180-04b5-09b2-e1c4-53eb5c9345d8@roeck-us.net>
 <d6074923-ee7e-4499-0e54-383a607d3c41@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6074923-ee7e-4499-0e54-383a607d3c41@alliedtelesis.co.nz>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 08, 2021 at 08:27:30PM +0000, Chris Packham wrote:
[ ... ]
> > Other than that, the only other real idea I have would be to monitor
> > the i2c bus.
> I am in the fortunate position of being able to go into the office and 
> even happen to have the expensive scope at the moment. Now I just need 
> to find a tame HW engineer so I don't burn myself trying to attach the 
> probes.
> 
A bit unrelated, but you can get scopes connected through usb which are
quite low-cost (like in the $100 range) and good enough for i2c testing.

Guenter
