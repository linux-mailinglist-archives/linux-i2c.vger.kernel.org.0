Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4C0481F21
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 19:19:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237082AbhL3STl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Dec 2021 13:19:41 -0500
Received: from mail-qv1-f43.google.com ([209.85.219.43]:41858 "EHLO
        mail-qv1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241694AbhL3STj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Dec 2021 13:19:39 -0500
Received: by mail-qv1-f43.google.com with SMTP id h5so22736940qvh.8;
        Thu, 30 Dec 2021 10:19:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2yzY9yb1iTmqDgxZDWcva5vpjS6YHf5zZE0/jFBw8h8=;
        b=IL8OyKVoLXY8PXEAx4kokx2X9KNtUGwZ8KFhaIFXuXPxMxZUyyDeP7OaT7mArD5UHS
         KQKuzAKWq4MH26/TfdrQGSfWoOTXYAXZLTdR+TiplM/sXTOiAFSQAH1xKFSP6JFDPL55
         ptcEtxV+S9Ozbru/X5i6TVpInCSRjRZfExOD8LOwgzlcsFim1EbMtgbaqw9ikTwSCLp2
         nlzqW7zDjBy0Y0nvXwoLpmzESPpAwMNKd6sXgExP8rM67zEo0MP7ttA6KEex/SGhGA9A
         v5438LX4zDb8BIMrrEulT52e1fHUE5Xp5NdE+2UTG8urxrBserR3dCmS0UZnB3BzZte6
         ifIQ==
X-Gm-Message-State: AOAM530UDacz3DnYO9YlFXb9YYMfYj2zadMDW0EpUoGUug1hWp59++Qy
        hmVhhWwSWWIKl3cDXzUqdmlSfHLmOipeu7v/c9A=
X-Google-Smtp-Source: ABdhPJzMGrlkdjsiHfMCVxTMMvu7dSVd7V6RUm8GcSc1IUFjRvdW6/eDbUpnS7xvnu1KuguWGywCpeWFC5ymMFYejU8=
X-Received: by 2002:a05:6214:20a2:: with SMTP id 2mr28484668qvd.52.1640888378385;
 Thu, 30 Dec 2021 10:19:38 -0800 (PST)
MIME-Version: 1.0
References: <20211230141722.512395-1-hdegoede@redhat.com> <20211230141722.512395-2-hdegoede@redhat.com>
 <CAJZ5v0jw7jNq8FgMFcF9p=YYiuYj=RuV2MTPqGu62QoaG_O1MQ@mail.gmail.com>
 <Yc3ytI/NxnGT0aVf@kunai> <CAJZ5v0jyHamePb+J-5JGFPOErzV0Vq1TCD=Yq83hC6eSccCFOg@mail.gmail.com>
 <8043413d-c61a-458b-c81f-dd6e98c05b48@redhat.com>
In-Reply-To: <8043413d-c61a-458b-c81f-dd6e98c05b48@redhat.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Thu, 30 Dec 2021 19:19:27 +0100
Message-ID: <CAJZ5v0ijK17Mff1GLP+QtFN6hJ_E4bFXVr=A2Z0WSHJMvGZnww@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ACPI / x86: Add acpi_quirk_skip_[i2c_client|serdev]_enumeration()
 helpers
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 30, 2021 at 7:18 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 12/30/21 19:00, Rafael J. Wysocki wrote:
> > On Thu, Dec 30, 2021 at 6:56 PM Wolfram Sang <wsa@kernel.org> wrote:
> >>
> >> Hi Rafael,
> >>
> >>> or please let me know if you want me to take this series.
> >>
> >> Yes, see cover-letter :)
> >
> > Oh well.
> >
> > I'll take it now, thanks!
>
> Thank you.
>
> I see this in your bleeding-edge branch now. I was wondering what this
> means wrt this making it into 5.17, or if you consider this 5.18
> material?

5.17

> Note 5.18 is fine, just wondering (mostly for the timing of merging
> the pdx86 side of this, which probably also is more 5.18 material).

OK
