Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE5118F408
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Mar 2020 13:05:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbgCWMFU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Mar 2020 08:05:20 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:44627 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726204AbgCWMFU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Mar 2020 08:05:20 -0400
Received: by mail-ed1-f65.google.com with SMTP id z3so15832008edq.11
        for <linux-i2c@vger.kernel.org>; Mon, 23 Mar 2020 05:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2i68poVy8vRwd9t209Q59KIy3oA1QEuhKJcVAvdbNzQ=;
        b=n/FIUW93odegnuVAHbDAoqF5qOyvWhkd3r5gPEV60GzlYpZLNeo057Ey+kAPMGjTt1
         9BO1tOWT0UmCMGJNAu3/RpHV8hLZsbVOJBaccZdacpZZmLsvLRz0DSZaENog2N7Om8G+
         a2hY4aAjsTjF8TC8h+aKxtsJW6dMNSbtuprhA/Hn7BoTB2I2gbZirWlKjhRSUhoZjbGx
         jS5qTQWGfTK8V5FGN1StqPqir+0KAcVMhO80vPS/9zXMr6qBnqhZNFTf9BCFDUXnn9FY
         c1HNazUOzhxNg536OLMn53k5i+TjKOSwPmUsALqyaT+lv6ndCppTNmieeRy+cSHTZdZg
         XYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2i68poVy8vRwd9t209Q59KIy3oA1QEuhKJcVAvdbNzQ=;
        b=Vh/6uuGyvTxyf2Ot2IfgaFV7Cms6Hc2fA0LvfBzi042rP3KokDgQJIEDdz5w/EL480
         NPESjQ16vpEjuoPpOGcjftnY7phNRyDMoQuKoFUvKuSneCbPKikgwquGiUc+ORZqF7fA
         hG3Dk8qOvinIRYVEwdENG02S41aw4vvQFwDLh2k3XtlubrM0rQMw+/RlM/eyYNzYQuoD
         nBXT+RpDcnrjo64nE47gE7dtvGtH6lGHWQYg//ru5nDTvN2BPuDZ8rif7nwCcPeGAnLL
         ZP/5mecSzOAv1AsUBDWZG1kp8opcHgkV3nA8tg60kdYf3QDmSopmHENCQp/QI752UQuv
         I8+Q==
X-Gm-Message-State: ANhLgQ3Js6+Kpfu++6DpryWFIaO+t7X+WWmcn3yAshzauD2CMg4fhku0
        RU14vAGsBiKumf26AWE4KF7sL7Ov0utuCx+ZxlLkXw==
X-Google-Smtp-Source: ADFU+vviAe9P7a4/rcdpyF4F5OZW/tR/DqEMJypVKiZyXFhL2pruiQG6Qkg4B4XRSHTQJ8ygj4NwJ0x2xs62/xGIo58=
X-Received: by 2002:a17:906:d8b0:: with SMTP id qc16mr11014551ejb.64.1584965118308;
 Mon, 23 Mar 2020 05:05:18 -0700 (PDT)
MIME-Version: 1.0
References: <1583770998-25449-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1583770998-25449-1-git-send-email-loic.poulain@linaro.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 23 Mar 2020 13:08:49 +0100
Message-ID: <CAMZdPi9U5Ls7dRQfxWsaZJtYpKGXUsPEpCvWbDz_LQUSKPDp1Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] i2c: Add Qualcomm CCI I2C driver
To:     wsa@the-dreams.de
Cc:     Vinod Koul <vkoul@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Todor Tomov <todor.tomov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Mon, 9 Mar 2020 at 17:19, Loic Poulain <loic.poulain@linaro.org> wrote:
>
> This commit adds I2C bus support for the Camera Control Interface
> (CCI) I2C controller found on the Qualcomm SoC processors. This I2C
> controller supports two masters and they are registered to the core.
>
> CCI versions supported in the driver are msm8916, msm8996 and sdm845.
>
> This is a rework of the patch posted by Vinod:
> https://patchwork.kernel.org/patch/10569961/
>
> With additional fixes + most of the comments addressed.
>
> Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Tested-by: Robert Foss <robert.foss@linaro.org>

Is there anything more I can do on my side to help you review this?

Regards,
Loic
