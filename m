Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B94043B62
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2019 17:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729318AbfFMP22 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jun 2019 11:28:28 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:9343 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728936AbfFMLa2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Jun 2019 07:30:28 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0233d40000>; Thu, 13 Jun 2019 04:30:28 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 13 Jun 2019 04:30:27 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 13 Jun 2019 04:30:27 -0700
Received: from [10.19.65.14] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Jun
 2019 11:30:23 +0000
Subject: Re: [PATCH V5 6/7] i2c: tegra: fix PIO rx/tx residual transfer check
To:     Dmitry Osipenko <digetx@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>
CC:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1560250274-18499-1-git-send-email-bbiswas@nvidia.com>
 <1560250274-18499-6-git-send-email-bbiswas@nvidia.com>
 <42ce2523-dab9-0cdf-e8ff-42631dd161b7@gmail.com>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <78140337-dca0-e340-a501-9e37eca6cc87@nvidia.com>
Date:   Thu, 13 Jun 2019 04:30:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <42ce2523-dab9-0cdf-e8ff-42631dd161b7@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560425428; bh=YYG3Tiz4rxKMT21cs3lh3b9nrormbWQ/O0K+STrBpY0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=WicijuZIUdky2TxWRGDNdLYw5f+XPpq9+IJWigt6YGcFEw+JTIqNN7VFtVrqLyRzG
         nksSrkAyy6ONVoyxEw4LSdl1aQT0QcRCMErxjB6BQBjRfz0sEVa8wU0y3VXH/sfxKg
         tdceaCN51wM1X4284IZmL//MefuZGpvhbX+UlK7Dv1RLICFNooy/F2dwEP0k0OTQ7n
         4khH4FFvjkB3t1gBxB7ysDEoYXlxM+RLqwz+MdXjqNE3mTwAIHFU24ccNQ9HJZqyus
         sKnCsh1eh8FFqi/jojAb+D67oOznkYH7fpE6UmPYUboDGP4C5LX0Wy+yLWaqBLmUgD
         OnHi38FN0Fq8A==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/12/19 7:30 AM, Dmitry Osipenko wrote:
> 11.06.2019 13:51, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Fix expression for residual bytes(less than word) transfer
>> in I2C PIO mode RX/TX.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>=20
> [snip]
>=20
>>   		/*
>> -		 * Update state before writing to FIFO.  If this casues us
>> +		 * Update state before writing to FIFO.  If this causes us
>>   		 * to finish writing all bytes (AKA buf_remaining goes to 0) we
>>   		 * have a potential for an interrupt (PACKET_XFER_COMPLETE is
>> -		 * not maskable).  We need to make sure that the isr sees
>> -		 * buf_remaining as 0 and doesn't call us back re-entrantly.
>> +		 * not maskable).
>>   		 */
>>   		buf_remaining -=3D words_to_transfer * BYTES_PER_FIFO_WORD;
>=20
> Looks like the comment could be removed altogether because it doesn't
> make sense since interrupt handler is under xfer_lock which is kept
> locked during of tegra_i2c_xfer_msg().
I would push a separate patch to remove this comment because of=20
xfer_lock in ISR now.

>=20
> Moreover the comment says that "PACKET_XFER_COMPLETE is not maskable",
> but then what I2C_INT_PACKET_XFER_COMPLETE masking does?
>=20
I2C_INT_PACKET_XFER_COMPLETE masking support available in Tegra chips=20
newer than Tegra30 allows one to not see interrupt after Packet transfer=20
complete. With the xfer_lock in ISR the scenario discussed in comment=20
can be ignored.

-regards,
  Bitan

