Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1342014BD2
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2019 16:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbfEFObE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 May 2019 10:31:04 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:41499 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbfEFObE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 May 2019 10:31:04 -0400
Received: by mail-vs1-f67.google.com with SMTP id g187so8256017vsc.8;
        Mon, 06 May 2019 07:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vlVIw6vZVRSOd+U7atr+9c1eQwA07taQdyi0YQSxezc=;
        b=sll1RVUAUXI6hmEPMAb7nMUvFPfC52yZbzrVrDlOe4udfQWSQeHtzag+DPSFEoIJL9
         pFzEPWOFBqUJpAu7KYrNT/zfWi2/aQp0rNigOnLYk5WmVYLxS/bYrNxhlOBn9MJuXd2j
         AGapMhYsP0tSavAAkIAwiK31jShxd9SvrskQVO33PFU+Q1M88/0qe4ilm5OkuIGnMQr6
         rTRiwWDEc/4LPWQTROxjihR1YFl/vSr2njK2uNhmDAWMBrk1swpt/tgjCQAiygJ3wFa8
         SJiqRwix3cy9eLObcVE9KJ9M7dcNF07TFr14v6kZVi9qy0nIlbizaaCEi4PfFMMTieb+
         duug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vlVIw6vZVRSOd+U7atr+9c1eQwA07taQdyi0YQSxezc=;
        b=E3VDoJ/MGNSufEX7Lr8PFuwiQUsk5HNOSfmIBz8Wa7keekP6qNNtatABfiSlqmiwGD
         IW6M5UcugNX0F0yCG6/Ya3P1oJNuiFuhPgWkVSwclQGqlL41gVCD54USjARVfEx0rLKp
         jaDIAhkQ386tXiAzZxBlq5LofY3FOO71PdVxK40KvhE657h/w/dW1mT4ymUwhbK095Bq
         /ZWWwLTQT4MhbEZCy/bv34VwzyvAzSZyzKHdnfpycpAn5/XzItbZhgd+/Zm8BAJNOGsd
         4RA3sL1g43TxL2+lc50YSnp/M/sH451oPUaHlTZeDVoDZr2x9e2JuSS3O4WIJACwTYB+
         p3HQ==
X-Gm-Message-State: APjAAAWE/QiDW1g29RXTJNpD2/01cUN1ZWICoPPq6aFhbBXWv0xAfAkJ
        Wa3C2OyyPOlnJn6jBtOPABWOcBmXy2PN7GqL0coLUA==
X-Google-Smtp-Source: APXvYqwSyY7J4ouI+5Trz/A/jLpV5Y7R4jongXOPkb4utCR+BNjaeweJZS+oVNu+eQWUwIkOcSqibzJiltv4cNYqx9E=
X-Received: by 2002:a67:fbc4:: with SMTP id o4mr3075513vsr.30.1557153063423;
 Mon, 06 May 2019 07:31:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190506151539.69ee75e8@endymion> <20190506151656.47494e56@endymion>
 <04843f27-bb0f-d631-32c8-80cd122b7399@linux.intel.com>
In-Reply-To: <04843f27-bb0f-d631-32c8-80cd122b7399@linux.intel.com>
From:   Dreamcat4 <dreamcat4@gmail.com>
Date:   Mon, 6 May 2019 15:30:26 +0100
Message-ID: <CAN39uTpQj=ebjhydX2LnukkMAS-_Qi-nBMsUCjE4J-B_4HN8LQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] eeprom: ee1004: Deal with nack on page selection
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Jean Delvare <jdelvare@suse.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Don't mind either way, please do as you see fit

On Mon, May 6, 2019 at 3:04 PM Jarkko Nikula
<jarkko.nikula@linux.intel.com> wrote:
>
> On 5/6/19 4:16 PM, Jean Delvare wrote:
> > Some EE1004 implementations will not properly ack page selection
> > commands. They still set the page correctly, so there is no actual
> > error. Deal with this case gracefully by checking the currently
> > selected page after we receive a nack. If the page is set right then
> > we can continue.
> >
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >   drivers/misc/eeprom/ee1004.c |   12 +++++++++++-
> >   1 file changed, 11 insertions(+), 1 deletion(-)
> >
> Does Dreamcat4 deserve reported and tested by tags here? I guess
> anonymous address is fine with those tags?
>
> (I re-tested these two patches on top of v5.1 and they make decode-dimms
> working on a machine with 2-4 * Crucial DD4 dimms)
>
> --
> Jarkko
