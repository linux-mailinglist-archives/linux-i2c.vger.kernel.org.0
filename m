Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C386F42388
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2019 13:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407606AbfFLLJC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jun 2019 07:09:02 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:42578 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407079AbfFLLJC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jun 2019 07:09:02 -0400
Received: by mail-qk1-f195.google.com with SMTP id b18so9803521qkc.9
        for <linux-i2c@vger.kernel.org>; Wed, 12 Jun 2019 04:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FhiOY2txl0OCsbDu27zcZMKK4R+p9r7/us+roDxgt3I=;
        b=XwjXTj5pAGUIp+XXOiFKWY88tSm3Wf+t2w3K0g1IFarLQNK+2jhelgzsImrQ31MqzA
         zaeJfg/9W+7PmLruZuld08gPyneeK8ZC6nCnHxVS12nn8LTDSXVg12dHAelOl2VKKCyD
         dhXRB+ArLbfTOMxd/jsrdzr89wsa4teG6CvooyRIGXCFVg+Q+62BXGMhxtVzs5G2qy4O
         L4FFStRF5Dlx3GnvfPykHHh8nqMNlbnVdoUa8ntv2VGh4+lQFU6RNAGJloO4AyIBvGaF
         3ckzKi0g5VnEgs1ycxUyJAUsN+A/QglP+qxlBpMuV+MwGeVD26kYwDXqoVrzQ/PdZWaw
         T1SQ==
X-Gm-Message-State: APjAAAWNcu6dYkwN4IdLifaDKu2TP5h3vsl4wgo7lPIYcMO7bPOn4TXB
        cGBoGOOtxqvEb5g1EcLWpIhSAU9Mb/CdKADPvAQ=
X-Google-Smtp-Source: APXvYqzzBqKD7hN8/F5WT+uJKqvZimB7ion/9hGK/7YU+QEWYfHgqozbOIok/tE0JZTTiVvZR1PBuEJr1jJsnFxIVCQ=
X-Received: by 2002:a37:a4d3:: with SMTP id n202mr63647564qke.84.1560337741639;
 Wed, 12 Jun 2019 04:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190531223756.1861-1-linus.walleij@linaro.org> <20190612110453.hzjgxeuw4amyb52c@ninjato>
In-Reply-To: <20190612110453.hzjgxeuw4amyb52c@ninjato>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 12 Jun 2019 13:08:44 +0200
Message-ID: <CAK8P3a2NpOa9AtHnOgmXUR1pBY4zpi6mP0wuSuLBk+wg8E9qtw@mail.gmail.com>
Subject: Re: [PATCH] i2c: iop: Use GPIO descriptors
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        arm-soc <arm@kernel.org>, Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 12, 2019 at 1:04 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > ARM SoC mainatiners: looking for a handshake ACK on this
> > so Wolfram can merge it into the I2C subsystem.
>
> Yes, I can pick it up, but an ARM SoC ack would be really good for that.

Ok, please merge it through your tree.

Acked-by: Arnd Bergmann <arnd@arndb.de>
