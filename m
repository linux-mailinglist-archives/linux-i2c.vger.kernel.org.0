Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 668909960B
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2019 16:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732404AbfHVONR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Aug 2019 10:13:17 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:35435 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732331AbfHVONR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Aug 2019 10:13:17 -0400
Received: by mail-ed1-f68.google.com with SMTP id t50so8169201edd.2;
        Thu, 22 Aug 2019 07:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
         :user-agent:mime-version;
        bh=EYVnrg2lJBCfy39x2nbuTmoZRzlTPWX5KYtniCIk6ns=;
        b=OmlQRiQI4xw17HQVd/NjySngBZQrNzzt6ScuaL7Iic43ufOdkCdoVzR4+tE3Hz3qcd
         5Qx0RKP95iVA166bXIdvf2K4egPEiDkrhEZvwdUlFstjdIm5YrnOTbTRed/2XXS7INsg
         HWDh2Z/Seo3EgDTin6bUKiis7bBEwXg5oRVCyLrvJUMihb9wYuXGV8bDhZw2q27Hef8F
         KVz++5KHoDj84gRg9TNqVQjCozArxGwA74C96dA681eHSygz01oSJdnpLaxZuGBP9xBZ
         XWHuBnkKQdQommoJMeyA/OIXzuQnS9cWzlkVughdYQJNqmM+4loR0KUW+v++zUlnXRtZ
         Mmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:references:date
         :in-reply-to:message-id:user-agent:mime-version;
        bh=EYVnrg2lJBCfy39x2nbuTmoZRzlTPWX5KYtniCIk6ns=;
        b=fDOFYNRWcq0vfbaQ9td4mRh/ABDw4mezUSjRMK/EzvwCpQL+4cPJAI45MtW/NKwOOB
         Qn4fqn1iYCK2BfZdSQY5tuGZySmPT4V2QmyIbqVvMXYQ/svRva34Q3UcrJRIJmxWknkV
         y0N7MjvRXaywA0i3/hL0r6KUOfHswW0FeOzj557jGUAhlKLJlvJpQmNvq9bTq/DMU71O
         aEx12pCSzebTF6YijQ65wIfbVEYTIIWaEkOdZfYZJMAS2jTgcXetpf4SbxCrpiwTBE5S
         mckyic9aW107gNEZPN7AzKGL0+3cU6yB05XeG0G1oL5Rp/1BTAudpVmr7xiPp0Tevg8N
         dvdg==
X-Gm-Message-State: APjAAAVpKTuYevs39gbFKcYMi242iVQDTtX5YAtxN9A4EpXIzaIMhKrh
        BZevrSyRUDN8e0hhtQxtQrpyGan0
X-Google-Smtp-Source: APXvYqz/7wA9dRBdNHwXXyrjMFR7jsw6APJLx1nxMwdnDsy+UeorVtjclneSGJxueMuk2UpVxr1Y7g==
X-Received: by 2002:aa7:ccc4:: with SMTP id y4mr14092992edt.1.1566483195670;
        Thu, 22 Aug 2019 07:13:15 -0700 (PDT)
Received: from dell.be.48ers.dk (d528f5fe4.static.telenet.be. [82.143.95.228])
        by smtp.gmail.com with ESMTPSA id gs21sm2776908ejb.40.2019.08.22.07.13.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2019 07:13:14 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.89)
        (envelope-from <peter@korsgaard.com>)
        id 1i0npx-0000jd-Jq; Thu, 22 Aug 2019 16:13:13 +0200
From:   Peter Korsgaard <peter@korsgaard.com>
To:     Federico Vaga <federico.vaga@cern.ch>
Cc:     Andrew Lunn <andrew@lunn.ch>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: ocores: use request_any_context_irq() to register IRQ handler
References: <20190822132132.16557-1-federico.vaga@cern.ch>
Date:   Thu, 22 Aug 2019 16:13:13 +0200
In-Reply-To: <20190822132132.16557-1-federico.vaga@cern.ch> (Federico Vaga's
        message of "Thu, 22 Aug 2019 15:21:32 +0200")
Message-ID: <875zmp5lvq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>>>>> "Federico" == Federico Vaga <federico.vaga@cern.ch> writes:

 > The i2c-ocores device is an HDL component that get instantiated in FPGA.
 > The software stack used to drive an FPGA can be very different, and the
 > i2c-ocore ip-core must work in different context. With respect to this
 > patch the IRQ controller behind this device, and its driver, can have
 > different implementations (nested threads). For this reason, it is safer
 > to use `request_any_context_irq()` to avoid errors at probe time.

 > Signed-off-by: Federico Vaga <federico.vaga@cern.ch>

Reviewed-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
