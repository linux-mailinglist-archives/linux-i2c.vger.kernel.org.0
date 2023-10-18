Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 741107CD9B6
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Oct 2023 12:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235153AbjJRKxD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 18 Oct 2023 06:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235219AbjJRKww (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Oct 2023 06:52:52 -0400
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DA00172B;
        Wed, 18 Oct 2023 03:52:08 -0700 (PDT)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-57f137dffa5so957209eaf.1;
        Wed, 18 Oct 2023 03:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697626327; x=1698231127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANkrkOONUD7WAdmVxqIhjrdidbxPHDe3du90f6KFvkY=;
        b=l5inhv+JTTEaOBPXoebTkP2Dc6v5jvBXmtCuUAwfx0HAP/1DvNLITSjFp9eX8uG0k/
         6SFjACvAoeIWlerIdXp9whdH7CSmgaKAAcrN7eFzVfy5rvQGIA89U2lSk2o6Ey53yybh
         JXj6VJa055umqgtgd4eAkCND6iLkh+Ug2HYL10/y7t9//8zQVeLRB13UGwdesDcShnv4
         8ixpIo8ZsUD9KkFs/IErTgEAaPuFVIXCR1TtY5vWj/Scc6Ypa/b1DOefLJaOqjGmiU+r
         UAf9RWeSG8dpWyU84jvTNHbSOCO8ESyF//IpHJhzu+/pF5ijLUVJvGvUh8iDC0m3WrBK
         m1AQ==
X-Gm-Message-State: AOJu0Yx7uUTrr4w5+2bWbikjsyMcFEjGlOFwwXn0U3ZGOVriKghgAKMG
        P+IdohFQKaJOk3crXFTZt1tvz5cecertp/4w0pw=
X-Google-Smtp-Source: AGHT+IG3bzWnIqloArAGqy9HdALld6R6WIUDeRYxWFSz2P1Ed+VQtP4ZPbYcpYkhuF1U44u1xWuBkWFCVRFE2yN8Ugs=
X-Received: by 2002:a4a:e1cd:0:b0:581:feb5:ac87 with SMTP id
 n13-20020a4ae1cd000000b00581feb5ac87mr892257oot.1.1697626327586; Wed, 18 Oct
 2023 03:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <90bd1071-317e-4dfe-b94b-9bcee15d66c5@gmail.com> <6e935761-5b36-411a-ac82-cbc394bba7b6@gmail.com>
In-Reply-To: <6e935761-5b36-411a-ac82-cbc394bba7b6@gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Wed, 18 Oct 2023 12:51:56 +0200
Message-ID: <CAJZ5v0gtH2sVo8Y1rH9SCarkfwJbwCX9BD4n+KpKpy3HRhM2Og@mail.gmail.com>
Subject: Re: [PATCH 1/2] ACPI: Add helper acpi_use_parent_companion
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Oct 15, 2023 at 11:34 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> In several drivers devices use the ACPI companion of the parent.
> Add a helper for this use case to avoid code duplication.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

or do you want me to apply it?

> ---
>  include/linux/acpi.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index ba3f601b6..89efb1658 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -1541,4 +1541,9 @@ static inline void acpi_device_notify(struct device *dev) { }
>  static inline void acpi_device_notify_remove(struct device *dev) { }
>  #endif
>
> +static inline void acpi_use_parent_companion(struct device *dev)
> +{
> +       ACPI_COMPANION_SET(dev, ACPI_COMPANION(dev->parent));
> +}
> +
>  #endif /*_LINUX_ACPI_H*/
> --
> 2.42.0
>
>
