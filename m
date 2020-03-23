Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF4718F457
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Mar 2020 13:18:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727413AbgCWMSj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Mar 2020 08:18:39 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:33152 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727381AbgCWMSj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Mar 2020 08:18:39 -0400
Received: by mail-ed1-f67.google.com with SMTP id z65so15973241ede.0
        for <linux-i2c@vger.kernel.org>; Mon, 23 Mar 2020 05:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LOuNnZgzyqcm8GFQy/Cs3MTKU0ONrbIzdq5zmi+oP6k=;
        b=HSUd4vdQOWkpZOlavXsGiTaSMf+lCfYpsCdFJSbN9eAuxw2kaPfwFbxExOUNmiJINM
         qb51YiC/4XO/9TFlK2gh3latsgjR8hoxSztzkUbqvez1Aadg52NkenrzRj0pCZ7iMDMO
         EePCTMvP8wdYeSdRSSGskUq0p1GfyStpyBmqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LOuNnZgzyqcm8GFQy/Cs3MTKU0ONrbIzdq5zmi+oP6k=;
        b=OHWwbXeq2NSm2eEd7UXCc3JVJ7UAuy66V6f9+PzU4eDDZFFnXUckUkR6vmE1v7zrAg
         +Ytzh1q9j+siQWdA4vu5ifqitieqeIAQ+p3VbMZ7QajG72mJjEXw8nD7bNBXLlYZzbEE
         qTBUMFmlidZ6esEegzFC71TU/0AxrBUW5+OXRJKixDcLO6UQEvZk5qjJmGQ9TBCxLkGa
         Q97sPsXv3np0cAMLrONWlUfsmz9CM5bjZqbVPmOtycSdKywwzCEj3+yHM7FXYXvYfrm+
         mLOk/W+uvCn6I271x2vGeDzUTuCGKR5+fxhddmjhDYg9b06tJBAj+cxVXBoH5M5Pi9Cy
         sEPw==
X-Gm-Message-State: ANhLgQ0uLhK2DjS0crTG9Y0bBzNsOeKE2AxG0xNTDvSYAGM11V0q4/eO
        fAKc6G81kBoRBMcwYw6ODnbT61vHXek=
X-Google-Smtp-Source: ADFU+vvsEfWXKfHcCldSc2/QPL/8FNebNFt9mOeOtSlxksSHwTHfyd+wPf8TH6tA2/0HnPuaU6MBCw==
X-Received: by 2002:a17:906:6a8d:: with SMTP id p13mr19675318ejr.196.1584965916777;
        Mon, 23 Mar 2020 05:18:36 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id b15sm1018335edn.69.2020.03.23.05.18.35
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2020 05:18:35 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id c81so3982142wmd.4
        for <linux-i2c@vger.kernel.org>; Mon, 23 Mar 2020 05:18:35 -0700 (PDT)
X-Received: by 2002:a1c:6a1a:: with SMTP id f26mr1797828wmc.55.1584965915045;
 Mon, 23 Mar 2020 05:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200306034946.11223-1-bibby.hsieh@mediatek.com>
 <20200306034946.11223-2-bibby.hsieh@mediatek.com> <20200322130710.GA1091@ninjato>
In-Reply-To: <20200322130710.GA1091@ninjato>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 23 Mar 2020 13:18:22 +0100
X-Gmail-Original-Message-ID: <CAAFQd5ANJcReHD_n0LorS+bjE8Cn_W-kY5LNgGG+L+jMmywYfA@mail.gmail.com>
Message-ID: <CAAFQd5ANJcReHD_n0LorS+bjE8Cn_W-kY5LNgGG+L+jMmywYfA@mail.gmail.com>
Subject: Re: [PATCH v12 1/2] dt-binding: i2c: add bus-supply property
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Mar 22, 2020 at 2:07 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>
> Hi,
>
> thanks for the patches!
>
> I have a high level question about them, first.
>
> > +- bus-supply
> > +     phandle to the regulator that provides power to i2c.
>
> I think this is not clear enough. I assume it means the regulator for
> driving SCL/SDA? In the coverletter you mention also an EEPROM. In your
> case, this is driven by the same regulator? I am skeptical we can
> abstract it like this because I2C devices could be driven by various
> regulators in the system, so there couldn't be one "bus regulator". The
> regulator for the EEPROM should be described in the EEPROM node. So,
> this "bus supply" is only for driving SCL/SDA?

In our case the bus-supply regulator drives the voltage rail to which
SCL/SDA are pulled up and there is an EEPROM on the bus, powered by
yet another rail. There is also another slave on the bus which uses
the same regulator as the bus-supply for its own power.

In other words, bus-supply only ensures that SCL and SDA are in a
usable state. Other consumers need to refer to the regulator in their
own supplies if they need it for their own power.

Does this answer your questions?

Best regards,
Tomasz
