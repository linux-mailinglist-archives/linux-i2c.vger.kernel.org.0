Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00AA1227C17
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jul 2020 11:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgGUJuc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jul 2020 05:50:32 -0400
Received: from mx2.suse.de ([195.135.220.15]:43112 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726109AbgGUJuc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Jul 2020 05:50:32 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 3B911AC12;
        Tue, 21 Jul 2020 09:50:37 +0000 (UTC)
Date:   Tue, 21 Jul 2020 11:50:29 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     wsa@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH for v5.9] i2c: Replace HTTP links with HTTPS ones
Message-ID: <20200721115029.5669984b@endymion>
In-Reply-To: <20200719193553.61319-1-grandmaster@al2klimov.de>
References: <20200719193553.61319-1-grandmaster@al2klimov.de>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Alexander,

On Sun, 19 Jul 2020 21:35:53 +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> (...)
>  Documentation/i2c/busses/i2c-ali1535.rst | 2 +-
>  Documentation/i2c/busses/i2c-ali15x3.rst | 2 +-
>  Documentation/i2c/busses/i2c-piix4.rst   | 4 ++--
>  drivers/i2c/busses/i2c-ali1535.c         | 2 +-
>  drivers/i2c/busses/i2c-ali15x3.c         | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)

The diffstat above does not match the changes below (specifically
i2c-piix4.rst is NOT modified by your actual patch).

> diff --git a/Documentation/i2c/busses/i2c-ali1535.rst b/Documentation/i2c/busses/i2c-ali1535.rst
> index 6941064730dc..3fe2bad63597 100644
> --- a/Documentation/i2c/busses/i2c-ali1535.rst
> +++ b/Documentation/i2c/busses/i2c-ali1535.rst
> @@ -28,7 +28,7 @@ Additionally, the sequencing of the SMBus transactions has been modified to
>  be more consistent with the sequencing recommended by the manufacturer and
>  observed through testing.  These changes are reflected in this driver and
>  can be identified by comparing this driver to the i2c-ali15x3 driver. For
> -an overview of these chips see http://www.acerlabs.com
> +an overview of these chips see https://www.acerlabs.com
> (...)

A quick visit to this website shows that it is dead and useless. The
closest thing nowadays would be https://www.ali.com.tw/ however as far
as I know ALI sold their x86 chipset business to Nvidia in 2006. I
couldn't find information about these old chipsets on either website
though, so I believe that the best course of action would be to strip
the links and surrounding sentences.

I understand this is beyond the scope of your current project. Do you
want me to take care of that?

-- 
Jean Delvare
SUSE L3 Support
