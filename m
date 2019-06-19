Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20DDA4B471
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2019 10:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731164AbfFSI6X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jun 2019 04:58:23 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:11759 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731064AbfFSI6X (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jun 2019 04:58:23 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d09f92c0000>; Wed, 19 Jun 2019 01:58:20 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 19 Jun 2019 01:58:20 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 19 Jun 2019 01:58:20 -0700
Received: from [10.21.132.148] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 19 Jun
 2019 08:58:18 +0000
Subject: Re: [PATCH V2] i2c: tegra: disable irq in tegra_i2c_xfer_msg
To:     Dmitry Osipenko <digetx@gmail.com>,
        Bitan Biswas <bbiswas@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>
CC:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1560847368-16069-1-git-send-email-bbiswas@nvidia.com>
 <cda89c10-c597-ce90-98dd-5cc13ee9b83d@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <d29aa32d-55ef-c98b-00cd-f836bf003662@nvidia.com>
Date:   Wed, 19 Jun 2019 09:58:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <cda89c10-c597-ce90-98dd-5cc13ee9b83d@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560934700; bh=Lca4KJSUw9Z+A5t4TvIo7YNbg53qHhjNpGl2oD0ukQY=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=lWhO2JjeglF+KImrs9gNzb9rWJ8rbnDCA1U5inPtbQghIGV2rqOPZtLlyT+fcaLX9
         l//ndtHEwbM6LrhzMTI56AoLewNzsSWbyrVbH9OlBci0CktI83r8RweRLqzE/qqqxm
         cEY4m5wa0tXr7s0CXGo4ykenqlQQZtxuvx0ZP4fVK9Hv/PFpaZ3aWn4RIUMbE/pUIJ
         aRqOYivBo9lWYVYjPpcZvncibrj8q9jf6Ziz5qHV2645FB/51yk4WAshqRCPSdnj91
         7TuQIIw3lLUSE5k9xmQwrNmijl5M2DmTMsJY51Z1Dc3ei4fw3YQ8FyDZrU8Oaq927H
         53b5fRKyMjj9g==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 18/06/2019 19:26, Dmitry Osipenko wrote:
> 18.06.2019 11:42, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> tegra_i2c_xfer_msg initiates the I2C transfer in DMA
>> or PIO mode. It involves steps that need FIFO register
>> access, DMA API calls like dma_sync_single_for_device, etc.
>> Tegra I2C ISR has calls to tegra_i2c_empty_rx_fifo in PIO mode
>> and in DMA/PIO mode writes different I2C registers including
>> I2C interrupt status. ISR cannot start processing
>> before the preparation step at tegra_i2c_xfer_msg is complete.
>> Hence, a synchronization between ISR and tegra_i2c_xfer_msg
>> is in place today using spinlock.
>=20
> Please use full 75 chars per-line, this should make commit message to loo=
k better.
>=20
>> Spinlock busy waits and can add avoidable delays.
>>
>> In this patch needed synchronization is achieved by disabling
>> I2C interrupt during preparation step and enabling interrupt
>> once preparation is over and spinlock is no longer needed.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>  drivers/i2c/busses/i2c-tegra.c | 17 ++++++++---------
>>  1 file changed, 8 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-teg=
ra.c
>> index 6fb545e..ccc7fae 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -240,7 +240,6 @@ struct tegra_i2c_hw_feature {
>>   * @bus_clk_rate: current I2C bus clock rate
>>   * @clk_divisor_non_hs_mode: clock divider for non-high-speed modes
>>   * @is_multimaster_mode: track if I2C controller is in multi-master mod=
e
>> - * @xfer_lock: lock to serialize transfer submission and processing
>>   * @tx_dma_chan: DMA transmit channel
>>   * @rx_dma_chan: DMA receive channel
>>   * @dma_phys: handle to DMA resources
>> @@ -270,8 +269,6 @@ struct tegra_i2c_dev {
>>  	u32 bus_clk_rate;
>>  	u16 clk_divisor_non_hs_mode;
>>  	bool is_multimaster_mode;
>> -	/* xfer_lock: lock to serialize transfer submission and processing */
>> -	spinlock_t xfer_lock;
>>  	struct dma_chan *tx_dma_chan;
>>  	struct dma_chan *rx_dma_chan;
>>  	dma_addr_t dma_phys;
>> @@ -835,7 +832,6 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_=
id)
>> =20
>>  	status =3D i2c_readl(i2c_dev, I2C_INT_STATUS);
>> =20
>> -	spin_lock(&i2c_dev->xfer_lock);
>>  	if (status =3D=3D 0) {
>>  		dev_warn(i2c_dev->dev, "irq status 0 %08x %08x %08x\n",
>>  			 i2c_readl(i2c_dev, I2C_PACKET_TRANSFER_STATUS),
>> @@ -935,7 +931,6 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_=
id)
>> =20
>>  	complete(&i2c_dev->msg_complete);
>>  done:
>> -	spin_unlock(&i2c_dev->xfer_lock);
>>  	return IRQ_HANDLED;
>>  }
>> =20
>> @@ -1054,7 +1049,6 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev=
 *i2c_dev,
>>  	u32 packet_header;
>>  	u32 int_mask;
>>  	unsigned long time_left;
>> -	unsigned long flags;
>>  	size_t xfer_size;
>>  	u32 *buffer =3D NULL;
>>  	int err =3D 0;
>> @@ -1085,7 +1079,10 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_de=
v *i2c_dev,
>>  	 */
>>  	xfer_time +=3D DIV_ROUND_CLOSEST(((xfer_size * 9) + 2) * MSEC_PER_SEC,
>>  					i2c_dev->bus_clk_rate);
>> -	spin_lock_irqsave(&i2c_dev->xfer_lock, flags);
>> +	if (!i2c_dev->irq_disabled) {
>> +		disable_irq_nosync(i2c_dev->irq);
>> +		i2c_dev->irq_disabled =3D true;
>> +	}
>=20
> 1) Peter correctly pointed out in the other email that the disabling shou=
ld be synced.
> But see more below in 3.
>=20
> 2) i2c_dev->irq_disabled =3D=3D true can't ever be the case here because =
tegra_i2c_init()
> re-enables interrupt in a case of error condition. Hence interrupt always=
 enabled at
> the beginning of the transfer.
>=20
> 3) In my previous answer I was suggesting to request IRQ in a disabled st=
ate, this
> will allow to remove i2c_dev->irq_disabled completely.
>=20
> Then the tegra_i2c_xfer_msg() will have to enable IRQ after completion of=
 the
> transfer-preparation process and disable IRQ once transfer is done (both =
success and
> failure cases). This is actually not a bad additional motivation for this=
 patch, to
> keep CPU's interrupt disabled while idling and not to only rely on interr=
upt masking
> of the I2C hardware.
>=20
> 4) ISR should simply return IRQ_NONE when interrupt status is 0 and allow=
 kernel core
> to disable the faulty interrupt itself. There will be "unhandled interrup=
t" error
> message in KMSG log, following the disabling.
>=20
> 5) In order to request IRQ in a disabled state, the IRQ_NOAUTOEN flag nee=
d to be set
> before the requesting, like this:
>=20
>     irq_set_status_flags(irq, IRQ_NOAUTOEN);
>=20
>     devm_request_irq(&pdev->dev, irq...);
>=20
> In a result of combining 3-5, both i2c_dev->irq_disabled and i2c_dev->irq=
 variables
> become obsolete and could be removed in addition to xfer_lock. That all i=
s a good
> cleanup in my opinion.

I see, so basically you are simplifying the code by waiting to enable
the interrupt until the transfer is ready and hence you can eliminate
the need for the spinlock. OK, that would make sense. This really needs
to be describe better in the changelog.

Also what about the tegra_i2c_unmask/mask_irq? Can these be eliminated?

Finally, what about tegra_i2c_issue_bus_clear()? This requires
interrupts as well.

Cheers
Jon

--=20
nvpublic
